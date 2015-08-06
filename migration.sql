
CREATE DATABASE wishlist;

\c wishlist

CREATE TABLE users (userID SERIAL PRIMARY KEY, user_name VARCHAR(255), user_email VARCHAR(255), password_salt VARCHAR(255), password_hash VARCHAR(255), is_admin BOOLEAN);

CREATE TABLE categories (categoryID SERIAL PRIMARY KEY, name VARCHAR(100));

CREATE TABLE items (itemID SERIAL PRIMARY KEY, userID INTEGER REFERENCES users(userID), attrID INTEGER REFERENCES attributes(attrID), itemtype BOOLEAN, categoryID INTEGER REFERENCES categories(categoryID), title VARCHAR(255), description VARCHAR(255));

CREATE TABLE attributes (attrID SERIAL PRIMARY KEY, color VARCHAR(255), size VARCHAR(255), condition VARCHAR(255), location VARCHAR(255));


-- CREATE TABLE item_SubCategory (itemID INT, SubCategoryID INT)
-- CREATE TABLE SubCategory (SubCategoryID INT, CategoryID INT, Description VARCHAR (100))

--For (type BOOLEAN) in items --> 0 = want | 1 = have
INSERT INTO categories (name)
VALUES
('Sporting Goods'), ('Electronics'), ('Home Goods'), ('Books'), ('Other');


-- TO be used with migrations via RAKE --
-- class ItemsModel < ActiveRecord::Migration
--   def change
--     create_table :items do |t|
--       t.belongs_to :users
--       t.VARCHAR(255) :title
--       t.VARCHAR(255) :description
--     end
--
--     create_table :category do |t|
--       t.belongs_to :items index: true
--       t.VARCHAR(100) :name
--     end
--
--     create_table :attributes do |t|
--       t.belongs_to :items, index: true
--       t.VARCHAR(255) :color
--       t.VARCHAR(255) :size
--       t.VARCHAR(255) :condtion
--       t.VARCHAR(255) :location
--     end
--   end
-- end
