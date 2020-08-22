package de.kreth.utilities.mysqlparser;

public interface LineReplacer {

    public String conditionalReplace(String line);

    public boolean isMatch(String line);
}
