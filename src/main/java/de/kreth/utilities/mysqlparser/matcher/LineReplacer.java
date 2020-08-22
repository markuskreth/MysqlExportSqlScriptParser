package de.kreth.utilities.mysqlparser.matcher;

public interface LineReplacer {

    public String conditionalReplace(String line);

    public boolean isMatch(String line);
}
