package de.kreth.utilities.mysqlparser;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.stringContainsInOrder;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.stream.Collectors;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import de.kreth.utilities.mysqlparser.config.TestParameters;

public class MyqlParserTest {

	private static String sqlConent;

	@BeforeAll
	static void loadTestText() throws IOException {
		try (BufferedReader in = new BufferedReader(
				new InputStreamReader(MyqlParserTest.class.getResourceAsStream("/clubhelper_test-Original.sql")))) {
			sqlConent = in.lines().collect(Collectors.joining(System.lineSeparator()));
		}
	}

	private StringReader reader;
	private StringWriter writer;
	private MysqlParser parser;

	@BeforeEach
	void initParser() {
		reader = new StringReader(sqlConent);
		writer = new StringWriter();
		TestParameters parameters = new TestParameters(reader, writer);
		parser = new MysqlParser(parameters);
	}

	@Test
	void testRemoveCreateAndUse() {
		parser.start();
		String result = writer.toString();
		assertNoContentLost(result);
	}

	private void assertNoContentLost(String result) {
		assertThat(result, stringContainsInOrder("DROP TABLE IF EXISTS `adress`;", "CREATE TABLE `adress` (",
				"INSERT INTO `adress` VALUES (", "DROP TABLE IF EXISTS `altersgruppe`;",
				"CREATE TABLE `altersgruppe` (", "INSERT INTO `altersgruppe` VALUES",
				"DROP TABLE IF EXISTS `attendance`;", "CREATE TABLE `attendance` (", "INSERT INTO `attendance` VALUES",
				"DROP TABLE IF EXISTS `clubevent`;", "CREATE TABLE `clubevent` (", "INSERT INTO `clubevent` VALUES ",
				"DROP TABLE IF EXISTS `clubevent_addon`;", "INSERT INTO `clubevent_addon` VALUES ",
				"DROP TABLE IF EXISTS `clubevent_has_person`;", "CREATE TABLE `clubevent_has_person` (",
				"INSERT INTO `clubevent_has_person` VALUES ", "DROP TABLE IF EXISTS `contact`;",
				"CREATE TABLE `contact` (", "INSERT INTO `contact` VALUES ", "INSERT INTO `contact` VALUES ",
				"DROP TABLE IF EXISTS `deleted_entries`;", "CREATE TABLE `deleted_entries` (",
				"INSERT INTO `deleted_entries` VALUES", "DROP TABLE IF EXISTS `event_has_altersgruppe`;",
				"CREATE TABLE `event_has_altersgruppe` (", "DROP TABLE IF EXISTS `groupdef`;",
				"CREATE TABLE `groupdef` (", "INSERT INTO `groupdef` VALUES ", "DROP TABLE IF EXISTS `notes`;",
				"CREATE TABLE `notes` (", "INSERT INTO `notes` VALUES", "DROP TABLE IF EXISTS `person`;",
				"CREATE TABLE `person` (", "INSERT INTO `person` VALUES ", "DROP TABLE IF EXISTS `persongroup`;",
				"CREATE TABLE `persongroup` (", "INSERT INTO `persongroup` VALUES", "DROP TABLE IF EXISTS `pflichten`;",
				"CREATE TABLE `pflichten` (", "INSERT INTO `pflichten` VALUES", "DROP TABLE IF EXISTS `relative`;",
				"CREATE TABLE `relative` (", "INSERT INTO `relative` VALUES ", "DROP TABLE IF EXISTS `startpaesse`;",
				"CREATE TABLE `startpaesse` (", "INSERT INTO `startpaesse` VALUES",
				"DROP TABLE IF EXISTS `startpass_startrechte`;", "CREATE TABLE `startpass_startrechte` (",
				"DROP TABLE IF EXISTS `version`;"));
	}
}
