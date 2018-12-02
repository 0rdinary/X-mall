Index의 Cardnality를 조사함.

1) Item
<img width="801" alt="item" src="https://user-images.githubusercontent.com/30919143/49335544-55052b80-f632-11e8-986b-a51bc8d0122f.png">
select count(distinct(Item_id)) Item_id,
-> count(distinct(Name)) Name,
-> count(distinct(Price)) Price,
-> count(distinct(Discount_rate)) Discount_rate,
-> count(distinct(Exp_date)) Exp_date,
-> count(distinct(Rating)) Rating,
-> count(distinct(Importer)) Importer,
-> count(distinct(CID)) CID,
-> count(distinct(PID)) PID
-> from ITEM;
+---------+------+-------+---------------+----------+--------+----------+-----+-----+
| Item_id | Name | Price | Discount_rate | Exp_date | Rating | Importer | CID | PID |
+---------+------+-------+---------------+----------+--------+----------+-----+-----+
|      45 |   45 |    40 |             4 |       34 |      4 |       24 |   9 |  15 |
+---------+------+-------+---------------+----------+--------+----------+-----+-----+
1 row in set (0.00 sec)


2) Category
<img width="576" alt="category" src="https://user-images.githubusercontent.com/30919143/49335557-b1684b00-f632-11e8-8287-04a6285fc957.png">
select count(distinct(CID)) CID,
-> count(distinct(Large_category)) Large_category,
-> count(distinct(Small_category)) Small_category
-> from CATEGORY;
+-----+----------------+----------------+
| CID | Large_category | Small_category |
+-----+----------------+----------------+
|   9 |              3 |              9 |
+-----+----------------+----------------+
1 row in set (0.00 sec)


3) ProducerLocation
<img width="482" alt="producerlocation" src="https://user-images.githubusercontent.com/30919143/49335558-b3caa500-f632-11e8-96a2-69a1aef1c95f.png">
select count(distinct(PID)) PID,
-> count(distinct(Producer)) Producer,
-> count(distinct(Location)) Location
-> from PRODUCERLOCATION;
+-----+----------+----------+
| PID | Producer | Location |
+-----+----------+----------+
|  15 |       15 |       14 |
+-----+----------+----------+
1 row in set (0.00 sec)



4) Retailer
<img width="812" alt="retailer" src="https://user-images.githubusercontent.com/30919143/49335595-79add300-f633-11e8-9bc1-8ceb9bf2559b.png">
select count(distinct(Store_idx)) Store_idx, 
count(distinct(Location)) Location
-> from RETAILER;
+-----------+----------+
| Store_idx | Location |
+-----------+----------+
|        20 |       20 |
+-----------+----------+
1 row in set (0.00 sec)

5) Customer
<img width="809" alt="customer" src="https://user-images.githubusercontent.com/30919143/49335596-7d415a00-f633-11e8-889b-c9bacd1daf17.png">
select count(distinct(User_id)) User_id,
-> count(distinct(User_password)) User_password,
-> count(distinct(Address)) Address,
-> count(distinct(Phone_number)) Phone_number,
-> count(distinct(Membership)) Membership,
-> count(distinct(Sex)) Sex,
-> count(distinct(Age)) Age,
-> count(distinct(Job)) Job
-> from CUSTOMER;
+---------+---------------+---------+--------------+------------+-----+-----+-----+
| User_id | User_password | Address | Phone_number | Membership | Sex | Age | Job |
+---------+---------------+---------+--------------+------------+-----+-----+-----+
|      55 |            54 |      16 |           55 |          5 |   2 |  45 |   4 |
+---------+---------------+---------+--------------+------------+-----+-----+-----+
1 row in set (0.00 sec)

6) ShoppingBag
<img width="541" alt="shoppingbag" src="https://user-images.githubusercontent.com/30919143/49335597-7e728700-f633-11e8-8b7b-b1312e37f880.png">
select count(distinct(User_id)) User_id,
-> count(distinct(Bag_idx)) Bag_idx,
-> count(distinct(Total_price)) Total_price,
-> count(distinct(Bag_name)) Bag_name
-> from SHOPPINGBAG;
+---------+---------+-------------+----------+
| User_id | Bag_idx | Total_price | Bag_name |
+---------+---------+-------------+----------+
|      54 |     179 |          65 |        0 |
+---------+---------+-------------+----------+
1 row in set (0.00 sec)

7) Manage
<img width="494" alt="manage" src="https://user-images.githubusercontent.com/30919143/49335608-dc06d380-f633-11e8-92af-304bbb313568.png">
select count(distinct(Store_idx)) Store_idx,
-> count(distinct(Location)) Location,
-> count(distinct(Item_id)) Item_id,
-> count(distinct(Stock)) Stock
-> from MANAGE;
+-----------+----------+---------+-------+
| Store_idx | Location | Item_id | Stock |
+-----------+----------+---------+-------+
|        20 |       20 |      45 |    97 |
+-----------+----------+---------+-------+
1 row in set (0.00 sec)

8) Include
<img width="485" alt="include" src="https://user-images.githubusercontent.com/30919143/49335609-de692d80-f633-11e8-810d-38612f461c0b.png">
select count(distinct(Bag_idx)) Bag_idx,
-> count(distinct(User_id)) User_id,
-> count(distinct(Item_id)) Item_id,
-> count(distinct(Stock)) Stock
-> from INCLUDE;
+---------+---------+---------+-------+
| Bag_idx | User_id | Item_id | Stock |
+---------+---------+---------+-------+
|     179 |      54 |      45 |     4 |
+---------+---------+---------+-------+
1 row in set (0.00 sec)

9)Ordered_By
<img width="621" alt="ordered_by" src="https://user-images.githubusercontent.com/30919143/49335611-e0cb8780-f633-11e8-91f3-f321b52f0e5f.png">
select count(distinct(User_id)) User_id,
-> count(distinct(Bag_idx)) Bag_idx,
-> count(distinct(Is_ordered)) Is_ordered,
-> count(distinct(When_ordered)) When_ordered,
-> count(distinct(Store_idx)) Store_idx
-> from ORDERED_BY
-> ;
+---------+---------+------------+--------------+-----------+
| User_id | Bag_idx | Is_ordered | When_ordered | Store_idx |
+---------+---------+------------+--------------+-----------+
|      54 |     179 |          2 |          142 |        20 |
+---------+---------+------------+--------------+-----------+
1 row in set (0.01 sec)




