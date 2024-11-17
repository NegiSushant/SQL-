create database Tyson;
use Tyson;
CREATE TABLE Client_Master(
	Client_No varchar(6),
	Name Varchar(20),
	Address1 Varchar(30),
	Address2 Varchar(30),
	City Varchar(15),
	State Varchar(15),
	Pincode Integer,
	Bal_Due float);

select * from Client_Master;

CREATE Table Product_Master(
	Product_No varchar(6),
	Description varchar(20),
	Profit_percentage int,
	Unit_Measure varchar(10),
	Qty_On_Hand int,
	Reorder_Lvl int,
	Sell_Price Float,
	Cost_Price Float);

/*Add a new column DOB to table Client_Master*/
Alter table Client_Master add DOB date;

/*3. Change the data type of Client_No to number*/
Alter table Client_Master alter Column Client_No int;

/*4. Drop the newly added column DOB from Client_Master.*/
Alter table Client_Master Drop column DOB;

/*5. Rename the column Sell_Price in Product_Master table to SellPrice.*/
Alter table Product_Master RENAME column Sell_Price to SellPrice;
/*work in sql server*/
EXEC sp_rename 'Product_Master.Sell_Price',  'SellPrice', 'COLUMN';
select * from Product_Master;

/*6. Rename the table Product_Master to ProductMaster.*/
EXEC sp_rename 'Product_Master', 'ProductMaster';

alter table Client_Master drop column Address2;
select * from Client_Master;
Alter table Client_Master alter Column Client_No varchar(6);
insert into Client_Master(Client_No, Name, City, Pincode, State, Bal_Due) values('C00001', 'Ivan Bayross', 'Mumbai', 400054, 'Maharashtra', 15000);

insert into Client_Master(Client_No, Name, City, Pincode, State, Bal_Due) values 
	('C00002', 'Mamta Mazumdar', 'Madras', 780001, 'Tamil Nadu', 0),
	('C00003', 'Chhaya Bankar', 'Mumbai', 400057, 'Maharashtra', 5000),
	('C00004', 'Ashwini Joshi', 'Bangalore', 560001, 'Karnataka', 0),
	('C00005', 'Hansel Colaco', 'Mumbai', 400060, 'Maharashtra', 2000),
	('C00006', 'Deepak Sharma', 'Mangalore', 560050, 'Karnataka', 0);


/*2. Exercise on retrieving records from the table:
a. Display the names of all the clients.
b. Retrieve the entire contents of the CLIENT_MASTER table.
c. Retrieve the list of names, city and the state of all the clients.
d. List all the clients who are located in Mumbai
e. Find the names of client who carries a balance of 15,000/-
f. List the details of the clients whose name starts with ‘M’.
g. List the details of clients who are staying in either Maharastra or in Karnataka.*/

select Name from Client_Master;
select * from Client_Master;
select Name, city, state from Client_Master;
select Name from Client_Master where City='Mumbai';
select Name from Client_Master where Bal_Due=15000;
select * from Client_Master where Name like 'M%';
select * from Client_Master where State='Maharastra' or state='Karnataka';
select * from Client_Master where State in ('Maharastra','Karnataka');


/*3. Exercise on updating records in a table:
a. Change the city of clientno ‘C00005’ to Bangalore.
b. Change the balance due of clientno ‘C00001’ to Rs. 1000.
c. Change the city of the client to Pune*/

update Client_Master set city='Bangalore' where Client_No='C00005';
update Client_Master set Bal_Due=1000 where Client_No='C00001';

/*4. Exercise on deleting records in a table:
a. Delete all clients from the CLIENT_MASTER.
b. Delete from CLIENT_MASTER where the column state holds the value ‘Tamil Nadu’*/

delete from Client_Master where State='Tamil Nadu';
delete from Client_Master;

drop Table ProductMaster;