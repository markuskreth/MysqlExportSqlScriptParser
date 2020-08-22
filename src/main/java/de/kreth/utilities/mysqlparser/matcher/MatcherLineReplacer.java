package de.kreth.utilities.mysqlparser.matcher;

public class MatcherLineReplacer implements LineReplacer {

    private final String replacement;
    private final LineMatcher matcher;

    public MatcherLineReplacer(String replacement, LineMatcher matcher) {
	super();
	this.replacement = replacement;
	this.matcher = matcher;
    }

    @Override
    public String conditionalReplace(String line) {
	if (!matcher.test(line)) {
	    return replacement;
	}
	return line;
    }

    @Override
    public boolean isMatch(String line) {
	return !matcher.test(line);
    }
}
