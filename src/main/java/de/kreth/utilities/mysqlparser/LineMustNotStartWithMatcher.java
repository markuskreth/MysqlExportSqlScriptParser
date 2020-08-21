package de.kreth.utilities.mysqlparser;

public class LineMustNotStartWithMatcher implements LineMatcher {

	final String disallowedLineStart;

	public LineMustNotStartWithMatcher(String disallowedLineStart) {
		super();
		this.disallowedLineStart = disallowedLineStart;
	}

	@Override
	public boolean test(String trimmed) {
		return !trimmed.startsWith(disallowedLineStart);
	}

}
