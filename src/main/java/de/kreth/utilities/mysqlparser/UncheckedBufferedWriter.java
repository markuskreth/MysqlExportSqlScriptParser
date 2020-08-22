package de.kreth.utilities.mysqlparser;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.io.Writer;

class UncheckedBufferedWriter extends BufferedWriter {

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