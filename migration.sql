CREATE DATABASE wishlist;

\c wishlist

CREATE TABLE users (userID SERIAL PRIMARY KEY, user_name VARCHAR(255), user_email VARCHAR(255), password_salt VARCHAR(255), password_hash VARCHAR(255), is_admin BOOLEAN);

CREATE TABLE category (categoryID SERIAL PRIMARY KEY, name VARCHAR(100));

CREATE TABLE items (itemID SERIAL PRIMARY KEY, userID INTEGER REFERENCES users(userID), type BOOLEAN, categoryID INTEGER REFERENCES category(categoryID), title VARCHAR(255), description VARCHAR(255));

CREATE TABLE attributes (attrID SERIAL PRIMARY KEY, itemID INTEGER REFERENCES items(itemID), color VARCHAR(255), size VARCHAR(255), condition VARCHAR(255), location VARCHAR(255));


-- CREATE TABLE item_SubCategory (itemID int, SubCategoryID int)
-- CREATE TABLE SubCategory (SubCategoryID int, CategoryID int, Description VARCHAR (100))


--For (type BOOLEAN) in items --> 0 = want | 1 = have
INSERT INTO category (name)
VALUES
('Sporting Goods'), ('Electronics'), ('Home Goods'), ('Books'), ('Other');
