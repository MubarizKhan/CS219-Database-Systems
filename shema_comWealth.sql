


# Task 2.2

create database wealth;

use wealth;


CREATE TABLE staff
  (
    id INTEGER PRIMARY KEY,
    name VARCHAR( 50 ) NOT NULL,
    email VARCHAR( 50 ) NOT NULL,
    address VARCHAR( 50 ) NOT NULL,
    job_title VARCHAR( 50 ) NOT NULL
  );


  CREATE TABLE customers
  (
    id   INTEGER PRIMARY KEY,
    name VARCHAR( 40 ) NOT NULL,
    address VARCHAR( 40 ) NOT NULL,
    salary VARCHAR( 40 ) NOT NULL,
    loan_limit VARCHAR( 40 ) NOT NULL
  );

  CREATE TABLE contacts
  (
    CONTACT_ID INTEGER 
                NOT NULL 
               PRIMARY KEY,
    FIRST_NAME  VARCHAR( 255 ) NOT NULL,
    LAST_NAME   VARCHAR( 255 ) NOT NULL,
    EMAIL       VARCHAR( 255 ) NOT NULL,
    PHONE       VARCHAR( 20 ),
    CUSTOMER_ID INTEGER ,
    CONSTRAINT FK_CONTACTS_CUSTOMERS 
      FOREIGN KEY( CUSTOMER_ID )
      REFERENCES customers( id ) 
      ON DELETE CASCADE
  );

  CREATE TABLE loan
  (
  	loan_id INTEGER PRIMARY KEY,
  	loan_date VARCHAR(10) NOT NULL,
  	staff_id INTEGER,
  	customer_id INTEGER,
  	CONSTRAINT FK_LOAN_CUSTOMERS 
      FOREIGN KEY( customer_id )
      REFERENCES customers( id ) 
      ON DELETE CASCADE,
    CONSTRAINT FK_loan_staff 
      FOREIGN KEY( staff_id )
      REFERENCES staff( id ) 
      ON DELETE CASCADE
  );

  CREATE TABLE suburbs
  (
  	id INTEGER,
  	address VARCHAR(50),
  	city VARCHAR(20),
  	postal_code VARCHAR(20),
  	country VARCHAR(20),
  	price VARCHAR(40)

  );


  CREATE TABLE properties
  (
  	id INTEGER PRIMARY KEY,
  	title VARCHAR(20) NOT NULL,
  	sale_price VARCHAR(20)
  	suburb_id INTEGER,
  	CONSTRAINT FK_PROP_SUBURB 
      FOREIGN KEY( suburb_id )
      REFERENCES suburbs( id ) 
      ON DELETE CASCADE
  );
