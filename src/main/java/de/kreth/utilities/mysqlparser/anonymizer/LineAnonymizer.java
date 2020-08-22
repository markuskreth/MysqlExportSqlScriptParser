package de.kreth.utilities.mysqlparser.anonymizer;

public interface LineAnonymizer {

    boolean isResponsible(String line);

    String anonymize(String line);
}
