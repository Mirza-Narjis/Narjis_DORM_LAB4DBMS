 -- create a database 
create database e_commerce_website;
use e_commerce_website;

-- 1) create tables for supplier,customer,category,product,supplier_pricing,order,rating to store the data for the website
-- create category table
create table category(
CAT_ID int primary key,
CAT_NAME varchar(20) not null
);

 -- create product table
create table product(
PRO_ID int primary key,
PRO_NAME varchar(20) not null default "Dummy",
PRO_DESC varchar(60),
CAT_ID int,
foreign key (CAT_ID) references category(CAT_ID)
);

-- create supplier table
create table supplier(
SUPP_ID int primary key,
SUPP_NAME varchar(50) not null,
SUPP_CITY varchar(50) not null,
SUPP_PHONE varchar(50) not null
);

-- create supplier_pricing table
create table supplier_pricing(
PRICING_ID int primary key,
PRO_ID int,
SUPP_ID int,
SUPP_PRICE int default 0,
foreign key(PRO_ID) references product(PRO_ID),
foreign key(SUPP_ID) references supplier(SUPP_ID)
);

-- create customer table
create table customer(
CUS_ID int primary key,
CUS_NAME varchar(20) not null,
CUS_PHONE varchar(10) not null,
CUS_CITY varchar(30) not null,
CUS_GENDER char
);

-- create order table
create table orders(
ORD_ID int primary key,
ORD_AMOUNT int not null,
ORD_DATE date not null,
CUS_ID int,
PRICING_ID int,
foreign key(CUS_ID) references customer(CUS_ID),
foreign key(PRICING_ID) references supplier_pricing(PRICING_ID)
);

-- create rating table
create table rating(
RAT_ID int primary key,
ORD_ID int,
RAT_RATSTARS int not null,
foreign key(ORD_ID) references orders(ORD_ID)
);

-- 2)	Insert the following data in the table created above

-- SUPPLIER TABLE
insert into supplier values(1, 'Rajesh Retails', 'Delhi', 1234567890),
			   (2, 'Appario Ltd.', 'Mumbai', 2589631470),
                           (3,	'Knome products', 'Banglore', 9785462315),
                           (4,	'Bansal Retails', 'Kochi', 8975463285),
                           (5,  'Mittal Ltd.', 'Lucknow', 7898456532);

-- CUSTOMER TABLE
insert into customer values(1, 'AAKASH', 9999999999, 'DELHI', 'M'),
						   (2, 'AMAN', 9785463215, 'NOIDA', 'M'),
                           (3, 'NEHA', 9999999999, 'MUMBAI', 'F'),
                           (4, 'MEGHA', 9994562399, 'KOLKATA', 'F'),
                           (5, 'PULKIT', 7895999999, 'LUCKNOW', 'M');
						
-- CATEGORY TABLE
insert into category values(1, 'BOOKS'),
			   (2, 'GAMES'),
                           (3, 'GROCERIES'),
                           (4, 'ELECTRONICS'),
                           (5, 'CLOTHES');

-- PRODUCT TABLE
insert into product values(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
			  (2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
                          (3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
                          (4, 'OATS', 'Highly Nutritious from Nestle', 3),
                          (5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
                          (6, 'MILK', '1L Toned Milk', 3),
                          (7, 'Boat Earphones',	'1.5Meter long Dolby Atmos', 4),
                          (8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
                          (9, 'Project IGI', 'compatible with windows 7 and above', 2),
                          (10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
                          (11, 'Rich Dad Poor Dad',	'Written by RObert Kiyosaki', 1),
                          (12, 'Train Your Brain', 'By Shireen Stephen', 1);


-- SUPPLIER_PRICING TABLE
insert into supplier_pricing values(1, 1, 2, 1500),
				   (2, 3, 5, 30000),
                                   (3, 5, 1, 3000),
                                   (4, 2, 3, 2500),
                                   (5, 4, 1, 1000),
                                   (6, 12, 2, 780),
                                   (7, 12, 4, 789),
                                   (8, 3, 1, 31000),
                                   (9, 1, 5, 1450),
                                   (10, 4, 2, 999),
                                   (11, 7, 3, 549),
                                   (12, 7, 4, 529),
                                   (13, 6, 2, 105),
                                   (14, 6, 1, 99),
                                   (15, 2, 5, 2999),
                                   (16, 5, 2, 2999);

-- ORDER TABLE
insert into orders values(101, 1500, '2021-10-06', 2, 1),
			 (102, 1000, '2021-10-12', 3, 5),
                         (103, 30000, '2021-09-16', 5, 2),
                         (104, 1500, '2021-10-05', 1, 1),
			 (105, 3000, '2021-08-16', 4, 3),
                         (106, 1450, '2021-08-18', 1, 9),
                         (107, 789, '2021-09-01', 3, 7),
                         (108, 780, '2021-09-07', 5, 6),
                         (109, 3000, '2021-00-10', 5, 3),
                         (110, 2500, '2021-09-10', 2, 4),
                         (111, 1000, '2021-09-15', 4, 5),
                         (112, 789, '2021-09-16', 4, 7),
                         (113, 31000, '2021-09-16', 1, 8),
                         (114, 1000, '2021-09-16', 3, 5),
                         (115, 3000, '2021-09-16', 5, 3),
                         (116, 99, '2021-09-17', 2, 14);

-- RATING TABLE
insert into rating values (1, 101, 4),
		          (2, 102, 3),
                          (3, 103, 1),
                          (4, 104, 2),
                          (5, 105, 4),
                          (6, 106, 3),
                          (7, 107, 4),
                          (8, 108, 4),
                          (9, 109, 3),
                          (10, 110, 5),
			  (11, 111, 3),
                          (12, 112, 4),
                          (13, 113, 2),
                          (14, 114, 1),
                          (15, 115, 1),
			  (16, 116, 0);
                          
 --  3)	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
	
    select count(CUS_GENDER) as Total_number_of_customers, 
    CUS_GENDER from
    (
    select CUS_GENDER, CUS_NAME from customer as customer_details
    inner join
    (select ORD_ID, CUS_ID from orders where ORD_AMOUNT >= 3000) as order_details
    on customer_details.CUS_ID = order_details.CUS_ID
    group by customer_details.CUS_ID
    ) as Tab 
    Group by CUS_GENDER;
    
    
	
 --  4)	Display all the orders along with product name ordered by a customer having Customer_Id=2
	
    select product.PRO_NAME, orders.*
    from orders, supplier_pricing, product
    where orders.CUS_ID=2
    and orders.PRICING_ID=supplier_pricing.PRICING_ID
    and supplier_pricing.PRO_ID = product.PRO_ID;
 
 --  5)	Display the Supplier details who can supply more than one product.
 
	select supplier.*
    from supplier
    where supplier.SUPP_ID in
    (select SUPP_ID
		from supplier_pricing
        group by SUPP_ID
        having count(SUPP_ID)>1)
	group by supplier.SUPP_ID;
 
 --  6)	Find the least expensive product from each category and print the table with category id, name, product name and price of the product
 
	select category.CAT_ID, category.CAT_NAME, min(t3.minimum_price) as minimum_price
    from category
		inner join
			(select product.CAT_ID, PRO_NAME, t2.*
            from product
				inner join 
					(select PRO_ID, min(SUPP_PRICE) as minimum_price
                    from supplier_pricing group by PRO_ID)
                    as t2 where t2.PRO_ID = product.PRO_ID)
                    as t3 where t3.CAT_ID = category.CAT_ID group by t3.CAT_ID;
 
 --  7)	Display the Id and Name of the Product ordered after “2021-10-05”.
	
    select product.PRO_ID, product.PRO_NAME
    from orders
		inner join 
			supplier_pricing on supplier_pricing.PRICING_ID  = orders.PRICING_ID
				inner join
					product on product.PRO_ID = supplier_pricing.PRO_ID
                    where orders.ORD_DATE > "2021-10-05";
                    
 --  8)	Display customer name and gender whose names start or end with character 'A'.
	select customer.CUS_NAME, customer.CUS_GENDER
    from customer
    where customer.CUS_NAME like 'A%' or customer.CUS_NAME like '%A';
 
 --  9)	Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
 
 --  Creating a new procedure.
DELIMITER //
CREATE PROCEDURE displayRating()

--   Embeding the code
BEGIN
SELECT report.supp_id,report.supp_name,report.Average,
CASE
WHEN report.Average =5 THEN 'Excellent Service'
WHEN report.Average >4 THEN 'Good Service'
WHEN report.Average >2 THEN 'Average Service'
ELSE 'Poor Service'
END AS Type_of_Service FROM
(SELECT final.SUPP_ID, supplier.SUPP_NAME, final.Average 
FROM
   (SELECT test2.SUPP_ID, SUM(test2.rat_ratstars)/COUNT(test2.rat_ratstars) AS Average 
     FROM
        (SELECT supplier_pricing.SUPP_ID, test.ORD_ID, test.RAT_RATSTARS 
              FROM supplier_pricing 
                INNER JOIN
                    (SELECT orders.PRICING_ID, rating.ORD_ID, rating.RAT_RATSTARS  
                          FROM orders  
                             INNER JOIN  
                                  rating ON rating.ORD_ID = orders.ORD_ID ) AS test
                                     ON test.PRICING_ID = supplier_pricing.PRICING_ID)
                                          AS test2 group by supplier_pricing.SUPP_ID)
                                             AS final 
                                               INNER JOIN 
                                                 supplier WHERE final.SUPP_ID = supplier.SUPP_ID) AS report;
END 
//
DELIMITER ;

 --  Invoking the procedure
 call displayRating();
