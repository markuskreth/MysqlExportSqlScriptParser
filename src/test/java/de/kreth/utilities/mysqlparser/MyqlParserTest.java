package de.kreth.utilities.mysqlparser;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;
import static org.hamcrest.Matchers.stringContainsInOrder;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.stream.Collectors;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import de.kreth.utilities.mysqlparser.config.TestParameters;

public class MyqlParserTest {

	private static String result;

	@BeforeAll
	static void loadTestText() throws IOException {
		try (BufferedReader in = new BufferedReader(
				new InputStreamReader(MyqlParserTest.class.getResourceAsStream("/clubhelper_test-Original.sql")))) {
			String sqlConent = in.lines().collect(Collectors.joining(System.lineSeparator()));

			StringReader reader = new StringReader(sqlConent);
			StringWriter writer = new StringWriter();
			TestParameters parameters = new TestParameters(reader, writer);
			MysqlParser parser = new MysqlParser(parameters);
			parser.start();
			result = writer.toString();
		}
	}

	@Test
	void relevantLinesArePresent() {
		assertNoContentLost(result);
	}

	@Test
	void testRemoveCreate() {
		assertThat(result, not(containsString("CREATE DATABASE  IF NOT EXISTS")));
	}

	@Test
	void testRemoveHostDatabase() {
		assertThat(result, not(containsString("-- Host: 127.0.0.1    Database: clubhelper")));
	}

	@Test
	void testRemoveSetters() {
		assertThat(result, not(containsString("40101 SET @OLD_CHARACTER_SET_CLIENT")));
		assertThat(result, not(containsString("@OLD_CHARACTER_SET_RESULTS")));
		assertThat(result, not(containsString("NAMES utf8")));
		assertThat(result, not(containsString("@OLD_SQL_NOTES=")));
		assertThat(result, not(containsString("40101 SET @saved_cs_client")));
		assertThat(result, not(containsString("SET character_set_client")));

	}

	@Test
	void testRemoveUse() {
		assertThat(result, not(containsString("USE `clubhelper`;")));
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
