package de.kreth.utilities.mysqlparser;

public class LineMustNotContainMatcher implements LineMatcher {

	private final String disallowedContent;

	public LineMustNotContainMatcher(String disallowedContent) {
		super();
		this.disallowedContent = disallowedContent;
	}

	@Override
	public boolean test(String trimmed) {
		return !trimmed.contains(disallowedContent);
	}

}
