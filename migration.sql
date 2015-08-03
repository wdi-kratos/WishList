CREATE DATABASE wishlist;

\c wishlist

CREATE TABLE user (id SERIAL PRIMARY KEY, user_name VARCHAR(255), email VARCHAR(255), password_salt VARCHAR(255), password_hash VARCHAR(255), join_date DATE);

CREATE TABLE want (id SERIAL PRIMARY KEY, user VARCHAR(255) refrences user(id), category VARCHAR(255), description VARCHAR(255), name VARCHAR(255), attr1 VARCHAR(255), attr2 VARCHAR(255), attr3 VARCHAR(255), attr4 VARCHAR(255), attr5 VARCHAR(255));

CREATE TABLE have (id SERIAL PRIMARY KEY, user VARCHAR(255) refrences user(id), category VARCHAR(255), description VARCHAR(255), name VARCHAR(255), attr1 VARCHAR(255), attr2 VARCHAR(255), attr3 VARCHAR(255), attr4 VARCHAR(255), attr5 VARCHAR(255));

CREATE TABLE match (id SERIAL PRIMARY KEY,)
