package de.kreth.utilities.mysqlparser.anonymizer;

import java.util.Calendar;

import de.kreth.utilities.mysqlparser.anonymizer.Testdata.Person;

public class PersonAnonymizer extends AbstractAnonymizer {

    @Override
    public boolean isResponsible(String line) {
	return line.startsWith("INSERT INTO \"person\" VALUES ");
    }

    @Override
    public String anonymize(String line) {

	testdata.nextIndicee();
	String modified = line;
	modified = anonymizeFirstName(modified, testdata.randomizedPerson());
	modified = anonymizeLastName(modified, testdata.randomizedPerson());
	modified = anonymizeBirthday(modified, testdata.randomizedPerson());
	return modified;
    }

    private String anonymizeBirthday(String modified, Person randomizedPerson) {
	int birthYear = Calendar.getInstance().get(Calendar.YEAR) - randomizedPerson.age;
	CharRange index = indexOfStringValue(modified, 2);
	String lineValue = getValue(modified, index);

	String replacement = birthYear + lineValue.substring(4);
	return replace(modified, index, replacement);
    }

    private String anonymizeLastName(String modified, Person randomizedPerson) {
	CharRange index = indexOfStringValue(modified, 1);
	return replace(modified, index, randomizedPerson.lastname);
    }

    private String anonymizeFirstName(String modified, Person randomizedPerson) {
	CharRange index = indexOfStringValue(modified, 0);
	return replace(modified, index, randomizedPerson.firstName);
    }

}
