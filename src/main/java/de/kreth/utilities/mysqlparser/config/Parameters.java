package de.kreth.utilities.mysqlparser.config;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;

public class Parameters {

	private String source;
	private String target;
	
	Parameters(String source, String target) {
		super();
		this.source = source;
		this.target = target;
	}

	public static Parameters createFrom(String[] args) {
		Parameters parameters = null;
		Options options = new Options();
		options.addOption("s", true, "Source sql script");
		options.addOption("t", true, "Target file name");
		
		CommandLineParser parser = new DefaultParser();
		try {
			CommandLine cmd = parser.parse(options, args);
			if (cmd.hasOption("s")) {
				new Parameters(cmd.getOptionValue("s"), cmd.getOptionValue("t", createDefaultFrom(cmd.getOptionValue("s"))));
			} else {
				printHelp(options);
				System.exit(-1);
			}
		} catch (ParseException e) {
			printHelp(options);
			System.exit(-1);
		}
		
		return parameters; 
	}

	private static String createDefaultFrom(String sourceName) {
		String target = new File(new File(sourceName).getAbsoluteFile().getParent(), "parsedScript.sql").getAbsolutePath();
		return target;
	}

	private static void printHelp(Options options) {
		HelpFormatter formatter = new HelpFormatter();
		formatter.printHelp("java -jar MysqlParser", options);
	}

	public String getSource() {
		return source;
	}

	public String getTarget() {
		return target;
	}
	
	public Reader createReader() throws FileNotFoundException {
		return new FileReader(source);
	}
	
	public Writer createWriter() throws IOException {
		return new FileWriter(target);
	}
}
