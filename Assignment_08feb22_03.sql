CREATE TABLE brands(
	brand_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
	brand_name VARCHAR2(50) NOT NULL,
	PRIMARY KEY(brand_id)
);

CREATE TABLE cars (
	car_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
	car_name VARCHAR2(255) NOT NULL,
	brand_id NUMBER NOT NULL,
	PRIMARY KEY(car_id),
	FOREIGN KEY(brand_id) 
	REFERENCES brands(brand_id) ON DELETE CASCADE
);

INSERT INTO brands(brand_name)
VALUES('Audi');


INSERT INTO brands(brand_name)
VALUES('BMW');


INSERT INTO brands(brand_name)
VALUES('Ford');


INSERT INTO brands(brand_name)
VALUES('Honda');


INSERT INTO brands(brand_name)
VALUES('Toyota');


INSERT INTO cars (car_name,brand_id)
VALUES('Audi R8 Coupe',
       1);


INSERT INTO cars (car_name,brand_id)
VALUES('Audi Q2',
       1);


INSERT INTO cars (car_name,brand_id)
VALUES('Audi S1',
       1);


INSERT INTO cars (car_name,brand_id)
VALUES('BMW 2-serie Cabrio',
       2);


INSERT INTO cars (car_name,brand_id)
VALUES('BMW i8',
       2);


INSERT INTO cars (car_name,brand_id)
VALUES('Ford Edge',
       3);


INSERT INTO cars (car_name,brand_id)
VALUES('Ford Mustang Fastback',
       3);


INSERT INTO cars (car_name,brand_id)
VALUES('Honda S2000',
       4);


INSERT INTO cars (car_name,brand_id)
VALUES('Honda Legend',
       4);


INSERT INTO cars (car_name,brand_id)
VALUES('Toyota GT86',
       5);


INSERT INTO cars (car_name,brand_id)
VALUES('Toyota C-HR',
       5);
SELECT * FROM cars;
SELECT * FROM brands;
-- creates audi_cars view that returns only Audi cars:
CREATE OR REPLACE VIEW 
audi_cars
AS SELECT 
CAR_ID , CAR_NAME , BRAND_ID
FROM 
CARS; 

SELECT * FROM audi_cars;

--Updatable view where we can insert the rows 
INSERT INTO audi_cars(
car_name ,brand_id
)
VALUES (
'BMW Z3 COUPE',2
);
SELECT * FROM audi_cars;
--updating the view 

UPDATE 
    audi_cars
SET 
    car_name='BMW 1-series',
    brand_id=2
    WHERE car_id=3;
  
  --creating view as checkoptions  clause 
  
  CREATE OR REPLACE VIEW food_cars
  AS SELECT 
  car_id , car_name , brand_id 
  FROM cars 
  where brand_id=3 WITH CHECK OPTION;
  
  --Now insert into food_cars
  INSERT
    INTO
        ford_cars(
            car_name,
            brand_id
        )
    VALUES(
        'Audi RS6 Avant',
        1
    );
--update the table 
UPDATE
    ford_cars
SET
    brand_id = 4,
    car_name = 'Honda NSX'
WHERE
    car_id = 6;