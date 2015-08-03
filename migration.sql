CREATE DATABASE wishlist;

\c wishlist

CREATE TABLE user (id SERIAL PRIMARY KEY, user_name VARCHAR(255), email VARCHAR(255), password_salt VARCHAR(255), password_hash VARCHAR(255), join_date DATE);

CREATE TABLE want (id SERIAL PRIMARY KEY, user VARCHAR(255) references user(id), category VARCHAR(255), description VARCHAR(255), name VARCHAR(255), color VARCHAR(255), size VARCHAR(255), condition VARCHAR(255), location VARCHAR(255));

CREATE TABLE have (id SERIAL PRIMARY KEY, user VARCHAR(255) references user(id), category VARCHAR(255), description VARCHAR(255), name VARCHAR(255), color VARCHAR(255), size VARCHAR(255), condition VARCHAR(255), location VARCHAR(255));

INSERT INTO user (user_name, email, password_salt)
