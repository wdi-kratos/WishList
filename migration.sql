CREATE DATABASE wishlist;

\c wishlist

CREATE TABLE users (userID SERIAL PRIMARY KEY, user_name VARCHAR(255), user_email VARCHAR(255), password_salt VARCHAR(255), password_hash VARCHAR(255), is_admin BOOLEAN);

CREATE TABLE items (itemID SERIAL PRIMARY KEY, userID INTEGER REFERENCES users(userID), typeID INTEGER REFERENCES type(typeID), categoryID INTEGER REFERENCES category(categoryID), description VARCHAR(255), title VARCHAR(255));

CREATE TABLE category (categoryID SERIAL PRIMARY KEY, description VARCHAR(100));

CREATE TABLE type (typeID SERIAL PRIMARY KEY, description VARCHAR(100));

CREATE TABLE attributes (attrID SERIAL PRIMARY KEY, itemID INTEGER REFERENCES items(itemID), color VARCHAR(255), size VARCHAR(255), condition VARCHAR(255), location VARCHAR(255));


-- CREATE TABLE item_SubCategory (itemID int, SubCategoryID int)
-- CREATE TABLE SubCategory (SubCategoryID int, CategoryID int, Description nvarchar(100))
