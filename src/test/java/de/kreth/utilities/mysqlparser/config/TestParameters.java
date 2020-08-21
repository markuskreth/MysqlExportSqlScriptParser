package de.kreth.utilities.mysqlparser.config;

import java.io.Reader;
import java.io.Writer;

public class TestParameters extends Parameters {

	private Reader reader;
	private Writer writer;

	public TestParameters(Reader reader, Writer writer) {
		super("", "");
		this.reader = reader;
		this.writer = writer;
	}

	@Override
	public Reader createReader() {
		return reader;
	}

	@Override
	public Writer createWriter() {
		return writer;
	}
}
