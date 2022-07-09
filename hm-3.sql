INSERT INTO dbo."Categories"(
	name)
	VALUES ( 'food'),('office'),('clothes');
INSERT INTO dbo."Dilers"(
	 name, adress)
	VALUES ( 'diler1', 'stachky77'),( 'diler2', 'test adress 12');
    INSERT INTO dbo."Stores"(
	 name, adress)
	VALUES ( 'STORE1', 'LENINA STREET 1'),( 'STORE2', 'KRASANOARMEYSKAYA STREET 99'),
    ( 'TEST_STORE', '1-ST LINE 323');
    
 INSERT INTO dbo."Manufacture"(
	 name)
	VALUES  ( 'Manufactured1'),('Manufactured2'),('Manuf2'),( 'TestMN'),('TEST2');

INSERT INTO dbo."Products"(
	 name, categories_id, manufacture_id)
	VALUES ('pencil', 2, 1),('pizza',1,2),('lastik',2,2),
	       ('penc324il', 2, 1),('pizza23',1,2),('lasti567k',2,2);
    
    
INSERT INTO dbo."Customers"(
 name)
VALUES ('new customer'),('rich customer'),('greedy customer');

INSERT INTO dbo."Purchases"(
	 customer_id, product_id, purchase_dt)
	VALUES ( 2, 1, (now() - interval '15 DAY')),( 3, 3, (now() - interval '15 DAY'));
    
 INSERT INTO dbo."Delivers"(
	 diler_id, store_id, product_id, deliver_date)
	VALUES ( 1, 2, 2, now() - interval '70 DAY'),( 2, 3, 1, now() - interval '4 MONTH'),
    ( 1, 3, 1, now() - interval '90 DAY'),( 2, 2, 3, now() - interval '3 MONTH');
    
 INSERT INTO dbo."Prices"(
	 product_id, change_date, price)
	VALUES (2,now() - interval '3 DAY' , 235.0),(5,now() - interval '1 DAY' , 400.0)
    ,(1,now() - interval '2 DAY' , 100.0);
    
    -- choose all names which contains numbers
    select * from  dbo."Products" where name ~ '.*([0-9]{1,7})'
    -- choose names which starts from l and contain numbers
     select * from  dbo."Products" where name ~ '^l.*([0-9]{1,7})'
    -- choose all names which not contain vales which starts on p and have numbers
     select * from  dbo."Products" where name !~ '^p.*[0-9]+'
     
     --choose all products which have prices and delivered among them
     select pr.*, p.* , d.diler_id, d.deliver_date   from dbo."Products" as pr 
     inner join dbo."Prices" as p
     on p.product_id = pr.id
     left join dbo."Delivers" d 
     on d.product_id = pr.id
     
     -- choose all delivers and display prices if exists
     select  pr.*, p.* , d.diler_id, d.deliver_date from  dbo."Delivers" d 
     inner join dbo."Products" pr
     on d.product_id = pr.id
     left join  dbo."Prices" as p
     on p.product_id = pr.id
     
     INSERT INTO dbo."Prices"(
	 product_id, change_date, price)
	VALUES (2,now() - interval '1 DAY' , 200.0)
    returning  product_id, change_date, price;
    
    update dbo."Prices" p
    set change_date = now() 
    from (select p.change_date, p.id from  dbo."Prices" as p  where p.price = 200.0 ) t
    where t.id = p.id
    
    
     delete from dbo."Delivers" d  where d.product_id in
    (select p.product_id from dbo."Prices" as p 
     inner join dbo."Purchases" as pu using (product_id))
     returning d.product_id ;
     
   
  
  