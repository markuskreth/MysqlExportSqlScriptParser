package de.kreth.utilities.mysqlparser;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import de.kreth.utilities.mysqlparser.matcher.LineMustNotContainIgnoreCaseMatcher;
import de.kreth.utilities.mysqlparser.matcher.MatcherLineReplacer;

class MatcherReplacerTest {

    @Test
    void testRemoveEngine() {
	LineMustNotContainIgnoreCaseMatcher matcher = new LineMustNotContainIgnoreCaseMatcher(") ENGINE=");
	String replacement = ")";
	MatcherLineReplacer replacer = new MatcherLineReplacer(replacement, matcher);

	String replaced = replacer.conditionalReplace(") ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;");
	assertEquals(")", replaced);

    }
}
