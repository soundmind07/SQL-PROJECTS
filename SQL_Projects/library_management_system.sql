DROP DATABASE IF EXISTS library_management;
CREATE DATABASE IF NOT EXISTS library_management;

DROP TABLE IF EXISTS library_management.user_login;
CREATE TABLE IF NOT EXISTS library_management.user_login(
user_id VARCHAR(255),
user_password TEXT,
first_name TEXT,
last_name TEXT,
sign_up_on DATE,
email_id TEXT,
PRIMARY KEY(user_id)
);

DROP TABLE IF EXISTS library_management.publisher;
CREATE TABLE IF NOT EXISTS library_management.publisher(
publisher_id VARCHAR(255),
publisher_name TEXT,
distributor TEXT,
releases_count INT,
last_date DATE,
PRIMARY KEY(publisher_id)
);

DROP TABLE IF EXISTS library_management.author;
CREATE TABLE IF NOT EXISTS library_management.author (
	author_id VARCHAR(255) PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	publications_count INT
);

DROP TABLE IF EXISTS library_management.books;
CREATE TABLE IF NOT EXISTS library_management.books (
	book_id VARCHAR(255) PRIMARY KEY,
    book_code TEXT,
    book_name TEXT,
    author_id TEXT REFERENCES library_management.author (author_id),
	publisher_id TEXT REFERENCES library_management.publisher (publisher_id),
    book_version TEXT,
    release_date DATE,
    available_from DATE,
    is_available BOOLEAN
);

DROP TABLE IF EXISTS library_management.readers;
CREATE TABLE IF NOT EXISTS library_management.readers (
	reader_id VARCHAR(255) PRIMARY KEY,
    first_name TEXT,
	last_name TEXT,
	registered_on DATE,
	books_issued_total INT,
	books_issued_current INT,
	is_issued BOOLEAN,
	last_issue_date DATE,
	total_fine FLOAT,
	current_fine FLOAT
);

DROP TABLE IF EXISTS library_management.settings;
CREATE TABLE IF NOT EXISTS library_management.settings (
	book_issue_count_per_reader INT,
	fine_per_day FLOAT,
	book_return_in_days INT
);