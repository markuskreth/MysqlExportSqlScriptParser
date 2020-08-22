package de.kreth.utilities.mysqlparser.anonymizer;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import de.kreth.utilities.mysqlparser.anonymizer.AbstractAnonymizer.CharRange;

class AdressAnonymizerTest {

    private AbstractAnonymizer anonymizer;

    @BeforeEach
    void initAnonymizer() {
	anonymizer = new AdressAnonymizer();
    }

    @Test
    void testRangeForValue0() {
	String line = "INSERT INTO \"adress\" VALUES (2,'Die Str. 45A','','30000','Hannover',1,'2019-01-29 00:06:52','2015-08-31 22:26:16',NULL);";
	CharRange range = anonymizer.indexOfStringValue(
		line,
		0);

	assertNotNull(range, "No range created");
	String theValue = getValue(line, range);
	assertEquals("Die Str. 45A", theValue);
    }

    @Test
    void testRangeForValue2() {
	String line = "INSERT INTO \"adress\" VALUES (2,'Die Str. 45A','','30000','Hannover',1,'2019-01-29 00:06:52','2015-08-31 22:26:16',NULL);";
	CharRange range = anonymizer.indexOfStringValue(
		line,
		2);

	String theValue = getValue(line, range);
	assertEquals("30000", theValue);
    }

    @Test
    void testRangeForContactValue() {
	String line = "INSERT INTO \"contact\" VALUES (1,'Telefon','+49 511 9611191',1,'2019-01-29 00:06:52','2015-08-31 22:26:08',NULL);";
	CharRange range = anonymizer.indexOfStringValue(
		line,
		1);

	String theValue = getValue(line, range);
	assertEquals("+49 511 9611191", theValue);
    }

    @Test
    void testReplaceMent() {
	String line = "INSERT INTO \"adress\" VALUES (2,'Die Str. 45A','','30000','Hannover',1,'2019-01-29 00:06:52','2015-08-31 22:26:16',NULL);";
	CharRange streetIndex = anonymizer.new CharRange();
	streetIndex.start = 32;
	streetIndex.end = 44;
	String modified = anonymizer.replace(line, streetIndex, "Neue Straße 3");
	String expected = "INSERT INTO \"adress\" VALUES (2,'Neue Straße 3','','30000','Hannover',1,'2019-01-29 00:06:52','2015-08-31 22:26:16',NULL);";
	assertEquals(expected, modified);

    }

    String getValue(String line, CharRange range) {
	return line.substring(range.start, range.end);
    }
}
