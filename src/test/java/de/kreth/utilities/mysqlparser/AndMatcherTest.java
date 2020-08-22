package de.kreth.utilities.mysqlparser;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import de.kreth.utilities.mysqlparser.matcher.AndMatcher;
import de.kreth.utilities.mysqlparser.matcher.LineMustNotContainMatcher;

public class AndMatcherTest {

	private AndMatcher matcher;

	@BeforeEach
	void initMatcher() {
		LineMustNotContainMatcher containHostMatcher = new LineMustNotContainMatcher("Host");
		LineMustNotContainMatcher containDatabaseMatcher = new LineMustNotContainMatcher("Database");
		matcher = new AndMatcher(containHostMatcher, containDatabaseMatcher);
	}

	@Test
	void bothFalse() {
		boolean condition = matcher.test("Weder das eine, noch das andere");
		assertTrue(condition, "None included should return true");
	}

	@Test
	void bothTrue() {
		boolean condition = matcher.test("Sowohl Host host als auch Database database ist enthalten");
		assertFalse(condition, "Should deni if both words are included.");
	}

	@Test
	void onlyFirstTrue() {

		boolean condition = matcher.test("Nur Host ist enthalten.");
		assertTrue(condition, "None included should return true");
	}

	@Test
	void onlySecondTrue() {

		boolean condition = matcher.test("Nur Database ist enthalten.");
		assertTrue(condition, "None included should return true");
	}
}
