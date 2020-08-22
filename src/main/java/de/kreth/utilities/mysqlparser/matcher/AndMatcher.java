package de.kreth.utilities.mysqlparser.matcher;

public class AndMatcher implements LineMatcher {

	private final LineMatcher[] matchers;

	public AndMatcher(LineMatcher... matchers) {
		super();
		this.matchers = matchers;
	}

	@Override
	public boolean test(String trimmed) {

		boolean result = false;
		for (LineMatcher lineMatcher : matchers) {
			result |= lineMatcher.test(trimmed);
		}
		return result;
	}

}
