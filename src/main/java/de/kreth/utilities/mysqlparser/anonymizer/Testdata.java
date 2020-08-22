package de.kreth.utilities.mysqlparser.anonymizer;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Testdata {

    private static Testdata INSTANCE;

    public static synchronized Testdata getInstance() {
	if (INSTANCE == null) {
	    INSTANCE = new Testdata();
	}
	return INSTANCE;
    }

    private List<Person> persons;
    private List<Adress> adresses;
    private List<String> emails;
    private List<String> phones;
    private Random random;

    private int currentPersonIndex;
    private int currentAdressIndex;
    private int currentEmailsIndex;
    private int currentPhonesIndex;

    private Testdata() {
	adresses = new ArrayList<>();
	persons = new ArrayList<>();
	emails = new ArrayList<>();
	phones = new ArrayList<>();

	InputStream stream = getClass().getResourceAsStream("/testdata.csv");
	BufferedReader in = new BufferedReader(new InputStreamReader(stream));
	in.lines().forEach(this::parse);
	random = new Random();
    }

    public void nextIndicee() {
	currentPersonIndex = random.nextInt(100);
	currentAdressIndex = random.nextInt(100);
	currentEmailsIndex = random.nextInt(100);
	currentPhonesIndex = random.nextInt(100);
    }

    public Person randomizedPerson() {
	return persons.get(currentPersonIndex);
    }

    public Adress randomizedAdress() {
	return adresses.get(currentAdressIndex);
    }

    public String randomizedEmail() {
	return emails.get(currentEmailsIndex);
    }

    public String randomizedPhone() {
	return phones.get(currentPhonesIndex);
    }

    private void parse(String line) {
	if (!line.startsWith("#")) {

	    String[] values = line.split(",");

	    String first = values[0];
	    String last = values[1];
	    String gender = values[2];
	    String age = values[3];
	    String street = values[4];
	    String zip = values[5];
	    String city = values[6];
	    String email = values[8];
	    String phone = values[9];

	    Person p = new Person();
	    p.firstName = first;
	    p.lastname = last;
	    p.gender = gender.charAt(0);
	    p.age = Integer.valueOf(age);

	    Adress a = new Adress();
	    a.street = street;
	    a.zip = zip;
	    a.city = city;

	    persons.add(p);
	    adresses.add(a);
	    emails.add(email);
	    phones.add(phone);
	}
    }

    public class Person {
	String firstName;
	String lastname;
	char gender;
	int age;
    }

    public class Adress {
	String street;
	String city;
	String zip;
    }

}
