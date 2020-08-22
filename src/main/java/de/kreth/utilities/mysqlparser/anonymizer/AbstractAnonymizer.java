package de.kreth.utilities.mysqlparser.anonymizer;

public abstract class AbstractAnonymizer implements LineAnonymizer {

    protected Testdata testdata = Testdata.getInstance();

    CharRange indexOfStringValue(String line, int valueIndex) {
	int index = line.indexOf("(");

	int currentValueIndex = 0;

	index = line.indexOf("'", index + 1) + 1;

	while (currentValueIndex < valueIndex) {
	    index = line.indexOf("'", index) + 1; // this end
	    index = line.indexOf("'", index) + 1; // next start
	    currentValueIndex++;
	}

	CharRange range = new CharRange();
	range.start = index;
	range.end = line.indexOf("'", index);
	return range;
    }

    String replace(String line, CharRange index, Object replacement) {

	StringBuilder newLine = new StringBuilder();
	newLine.append(line.substring(0, index.start));
	newLine.append(replacement);
	newLine.append(line.substring(index.end));

	return newLine.toString();
    }

    String getValue(String line, CharRange range) {
	return line.substring(range.start, range.end);
    }

    class CharRange {
	int start;
	int end;
    }
}