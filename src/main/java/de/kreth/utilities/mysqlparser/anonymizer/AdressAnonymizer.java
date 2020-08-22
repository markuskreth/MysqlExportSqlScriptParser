package de.kreth.utilities.mysqlparser.anonymizer;

import de.kreth.utilities.mysqlparser.anonymizer.Testdata.Adress;

public class AdressAnonymizer extends AbstractAnonymizer {

    @Override
    public boolean isResponsible(String line) {
	return line.startsWith("INSERT INTO \"adress\"");
    }

    @Override
    public String anonymize(String line) {

	testdata.nextIndicee();
	String modified = line;
	modified = anonymizeStreet(modified, testdata.randomizedAdress());
	modified = anonymizeZip(modified, testdata.randomizedAdress());
	modified = anonymizeCity(modified, testdata.randomizedAdress());
	return modified;
    }

    private String anonymizeStreet(String line, Adress adress) {
	CharRange streetIndex = indexOfStringValue(line, 0);
	return replace(line, streetIndex, adress.street);
    }

    private String anonymizeZip(String line, Adress adress) {
	CharRange streetIndex = indexOfStringValue(line, 2);
	return replace(line, streetIndex, adress.zip);
    }

    private String anonymizeCity(String line, Adress adress) {
	CharRange streetIndex = indexOfStringValue(line, 3);
	return replace(line, streetIndex, adress.city);
    }

}
