package de.kreth.utilities.mysqlparser;

import java.util.function.Predicate;

public class LineMustNotStartWithMatcher implements Predicate<String> {

	private final String disallowedLineStart;

	public LineMustNotStartWithMatcher(String disallowedLineStart) {
		super();
		this.disallowedLineStart = disallowedLineStart;
	}

	@Override
	public boolean test(String trimmed) {
		return !trimmed.startsWith(disallowedLineStart);
	}

}
