CREATE DATABASE wishlist;

\c wishlist

CREATE TABLE users (id SERIAL PRIMARY KEY, user_name VARCHAR(255), user_email VARCHAR(255), password_salt VARCHAR(255), password_hash VARCHAR(255), is_admin BOOLEAN);

CREATE TABLE category (id SERIAL PRIMARY KEY, name VARCHAR(25))
CREATE TABLE type (id SERIAL PRIMARY KEY, type VARCHAR(100), created DATE)

CREATE TABLE items (id SERIAL PRIMARY KEY, type CHAR user_id INTEGER REFERENCES users(id), category VARCHAR(255), description VARCHAR(255), name VARCHAR(255), color VARCHAR(255), size VARCHAR(255), condition VARCHAR(255), location VARCHAR(255));
