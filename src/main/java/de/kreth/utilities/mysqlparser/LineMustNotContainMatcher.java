package de.kreth.utilities.mysqlparser;

import java.util.function.Predicate;

public class LineMustNotContainMatcher implements Predicate<String> {

	private final String disallowedContent;

	public LineMustNotContainMatcher(String disallowedContent) {
		super();
		this.disallowedContent = disallowedContent.toLowerCase();
	}

	@Override
	public boolean test(String trimmed) {
		return !trimmed.contains(disallowedContent);
	}

}
