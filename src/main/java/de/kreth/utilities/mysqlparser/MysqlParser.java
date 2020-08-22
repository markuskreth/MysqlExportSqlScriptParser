package de.kreth.utilities.mysqlparser;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import de.kreth.utilities.mysqlparser.config.Parameters;
import de.kreth.utilities.mysqlparser.matcher.AndMatcher;
import de.kreth.utilities.mysqlparser.matcher.LineMatcher;
import de.kreth.utilities.mysqlparser.matcher.LineMustNotContainIgnoreCaseMatcher;
import de.kreth.utilities.mysqlparser.matcher.LineMustNotContainMatcher;
import de.kreth.utilities.mysqlparser.matcher.LineMustNotStartWithMatcher;
import de.kreth.utilities.mysqlparser.matcher.LineReplacer;
import de.kreth.utilities.mysqlparser.matcher.MatcherLineReplacer;

public class MysqlParser {

    private Parameters parms;
    private final Logger logger = LoggerFactory.getLogger(getClass());

    private final List<LineMatcher> tests;
    private final List<LineReplacer> replacers;

    MysqlParser(Parameters parms) {
	this.parms = parms;

	List<LineMatcher> matchers = new ArrayList<>();
	matchers.add(new LineMustNotContainIgnoreCaseMatcher("create database  if not exists"));
	matchers.add(new LineMustNotStartWithMatcher("USE"));
	matchers.add(new AndMatcher(new LineMustNotContainMatcher("Host"), new LineMustNotContainMatcher("Database")));
	matchers.add(new LineMustNotContainIgnoreCaseMatcher("Server version"));
	matchers.add(new LineMustNotStartWithMatcher("/*!"));

	tests = Collections.unmodifiableList(matchers);

	LineMatcher matcher = new LineMustNotContainIgnoreCaseMatcher(") ENGINE=");
	LineReplacer replacer = new MatcherLineReplacer(")", matcher);
	replacers = Collections.unmodifiableList(Arrays.asList(replacer));
    }

    public static void main(String[] args) {
	Parameters parms = Parameters.createFrom(args);
	new MysqlParser(parms).start();
    }

    public void start() {
	logger.debug("Start parsing with source={} and target={}", parms.getSource(), parms.getTarget());
	try (BufferedReader input = new BufferedReader(parms.createReader())) {
	    try (UncheckedBufferedWriter out = new UncheckedBufferedWriter(parms.createWriter())) {
		input.lines()
			.filter(this::doIncludeLine)
			.map(this::doReplaceLine)
			.forEach(out::appendLineUnchecked);
	    } catch (IOException e) {
		logger.error("Unable to write Target: {}", parms.getTarget(), e);
	    }
	} catch (IOException e) {
	    logger.error("Source not found: {}", parms.getSource(), e);
	}
    }

    private String doReplaceLine(String line) {
	for (LineReplacer lineReplacer : replacers) {
	    if (lineReplacer.isMatch(line)) {
		return lineReplacer.conditionalReplace(line);
	    }
	}
	return line;
    }

    private boolean doIncludeLine(String line) {
	String trimmed = line.trim();
	Iterator<LineMatcher> iterator = tests.iterator();

	boolean result = true;
	while (result && iterator.hasNext()) {
	    result &= iterator.next().test(trimmed);
	}
	return result;
    }
}
