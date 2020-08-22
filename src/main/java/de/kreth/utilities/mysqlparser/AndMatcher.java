package de.kreth.utilities.mysqlparser;

public class AndMatcher implements LineMatcher {

	private final LineMatcher[] matchers;

	public AndMatcher(LineMatcher... matchers) {
		super();
		this.matchers = matchers;
	}

	@Override
	public boolean test(String trimmed) {

		boolean result = true;
		for (LineMatcher lineMatcher : matchers) {
			result &= lineMatcher.test(trimmed);
			if (!result) {
				break;
			}
		}
		return result;
	}

}
