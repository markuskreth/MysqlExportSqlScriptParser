package de.kreth.utilities.mysqlparser;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import de.kreth.utilities.mysqlparser.anonymizer.AdressAnonymizer;
import de.kreth.utilities.mysqlparser.anonymizer.ContactAnonymizer;
import de.kreth.utilities.mysqlparser.anonymizer.LineAnonymizer;
import de.kreth.utilities.mysqlparser.anonymizer.PersonAnonymizer;
import de.kreth.utilities.mysqlparser.config.Parameters;

public class Anonymize {

    private final Logger logger = LoggerFactory.getLogger(getClass());
    private List<LineAnonymizer> anonymizers;
    private Parameters parms;

    public Anonymize(Parameters parms) {
	this.parms = parms;
	anonymizers = new ArrayList<>();
	anonymizers.add(new PersonAnonymizer());
	anonymizers.add(new AdressAnonymizer());
	anonymizers.add(new ContactAnonymizer());
    }

    public static void main(String[] args) {
	Parameters parms = Parameters.createFrom(args);
	new Anonymize(parms).start();
    }

    public void start() {
	logger.debug("Start parsing with source={} and target={}", parms.getSource(), parms.getTarget());
	try (BufferedReader input = new BufferedReader(parms.createReader())) {
	    try (UncheckedBufferedWriter out = new UncheckedBufferedWriter(parms.createWriter())) {
		input.lines()
			.map(this::mapLine)
			.forEach(out::appendLineUnchecked);
	    } catch (IOException e) {
		logger.error("Unable to write Target: {}", parms.getTarget(), e);
	    }
	} catch (IOException e) {
	    logger.error("Source not found: {}", parms.getSource(), e);
	}
    }

    private String mapLine(String line) {
	if (line.startsWith("INSERT INTO")) {
	    return anonymizeLine(line);
	}
	return line;
    }

    private String anonymizeLine(String line) {
	String result = line;

	for (LineAnonymizer lineAnonymizer : anonymizers) {
	    if (lineAnonymizer.isResponsible(result)) {
		result = lineAnonymizer.anonymize(result);
		break;
	    }
	}

	return result;
    }

}
