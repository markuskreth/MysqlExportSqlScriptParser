package de.kreth.utilities.mysqlparser;

public class LineMustNotContainIgnoreCaseMatcher implements LineMatcher {

	private String disallowedContent;

	public LineMustNotContainIgnoreCaseMatcher(String disallowedContent) {
		super();
		this.disallowedContent = disallowedContent.toLowerCase();
	}

	@Override
	public boolean test(String trimmed) {
		return !trimmed.toLowerCase().contains(disallowedContent);
	}

}
