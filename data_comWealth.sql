  

  # Task 2.3

  

  INSERT INTO customers VALUES(001, 'DANISH', 'LHR', '100,000', '700,000');
  INSERT INTO customers VALUES(002, 'ALI', 'ISB', '10,000', '70,000');
  INSERT INTO customers VALUES(003, 'WAQAS', 'MULTAN', '100', '700');
  INSERT INTO customers VALUES(004, 'TOMMY', 'ISB', '200', '1400');
  INSERT INTO customers VALUES(005, 'DANIYAL', 'LHR', '5000', '35000');
  INSERT INTO customers VALUES(006, 'HASSAN', 'PWR', '2000', '14,000');


  INSERT INTO properties VALUES(1001, 'house1', '200,000', 4);
  INSERT INTO properties VALUES(1002, 'house2', '1400', 4);
  INSERT INTO properties VALUES(1003, 'house3', '700', 1);
  INSERT INTO properties VALUES(1004, 'house4', '1400', 2);
  INSERT INTO properties VALUES(1005, 'house5', '14,000', 5);

  INSERT INTO properties VALUES(105, 'house6', '35000', 1);
  INSERT INTO properties VALUES(106, 'house7', '700,000', 2);
  INSERT INTO properties VALUES(107, 'house8', '60,000', 5);
  INSERT INTO properties VALUES(108, 'house9', '5000', 3);
  INSERT INTO properties VALUES(109, 'house10', '6000', 5);


  INSERT INTO suburbs VALUES(1, 'iqbal town', 'lhr', '042', 'pak', '20,000');
  INSERT INTO suburbs VALUES( 2, 'johar town', 'lhr', '042', 'pak', '10,000');
  INSERT INTO suburbs VALUES( 3, 'gulshan e ravi', 'lhr', '042', 'pak', '5,000');
  INSERT INTO suburbs VALUES( 4, 'G/6-2', 'ISB', '051', 'pak', '4,000');
  INSERT INTO suburbs VALUES( 5, 'G/13', 'ISB', '051', 'pak', '50,000');

  # task 2.4


  select firstname from contacts, customers where contacts.CUSTOMER_ID = customers.id 
  order by FIRSTNAME, LASTNAME; 

  # task 2.5

  select avg(price) from suburbs;