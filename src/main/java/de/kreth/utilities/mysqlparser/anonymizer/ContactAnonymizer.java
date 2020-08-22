package de.kreth.utilities.mysqlparser.anonymizer;

public class ContactAnonymizer extends AbstractAnonymizer {

    @Override
    public boolean isResponsible(String line) {
	return line.startsWith("INSERT INTO \"contact\" VALUES ");
    }

    @Override
    public String anonymize(String line) {

	testdata.nextIndicee();
	CharRange index = indexOfStringValue(line, 1);
	if (line.contains("Telefon")) {
	    return replace(line, index, testdata.randomizedPhone());
	} else {
	    return replace(line, index, testdata.randomizedEmail());
	}
    }

}
