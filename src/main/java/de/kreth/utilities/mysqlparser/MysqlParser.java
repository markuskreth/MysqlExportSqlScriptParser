package de.kreth.utilities.mysqlparser;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.io.Writer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import de.kreth.utilities.mysqlparser.config.Parameters;

public class MysqlParser {

	private Parameters parms;
	private final Logger logger = LoggerFactory.getLogger(getClass());

	MysqlParser(Parameters parms) {
		this.parms = parms;
	}

	public static void main(String[] args) {
		Parameters parms = Parameters.createFrom(args);
		new MysqlParser(parms).start();
	}

	public void start() {
		logger.debug("Start logging with source={} and target={}", parms.getSource(), parms.getTarget());
		try (BufferedReader input = new BufferedReader(parms.createReader())) {
			try (UncheckedBufferedWriter out = new UncheckedBufferedWriter(parms.createWriter())) {
				input.lines().filter(this::doIncludeLine).forEach(out::appendLineUnchecked);
			} catch (IOException e) {
				logger.error("Unable to write Target: ", parms.getTarget(), e);
			}
		} catch (IOException e) {
			logger.error("Source not found: {}", parms.getSource(), e);
		}

	}

	private boolean doIncludeLine(String line) {
		String trimmed = line.trim().toLowerCase();
		boolean result = !trimmed.contains("create database  if not exists");
		result &= !trimmed.startsWith("use");
		return result;
	}

	private class UncheckedBufferedWriter extends BufferedWriter {

		public UncheckedBufferedWriter(Writer out) {
			super(out);
		}

		public void appendLineUnchecked(CharSequence line) {
			try {
				append(line).append(System.lineSeparator());
			} catch (IOException e) {
				throw new UncheckedIOException("Error writing line \"" + line + "\"", e);
			}
		}
	}
}
