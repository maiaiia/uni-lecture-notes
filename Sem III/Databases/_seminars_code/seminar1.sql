use sem_2025_2026

CREATE TABLE Chefs
(
    cid SMALLINT PRIMARY KEY, 
    cname VARCHAR(200),
    email VARCHAR(200) unique,
    birthday DATE,
    salary DECIMAL(10,2)
)

ALTER TABLE Chefs ADD experience int NOT NULL
ALTER TABLE Chefs DROP COLUMN birthday
ALTER TABLE Chefs ALTER COLUMN salary FLOAT

CREATE TABLE Recipes 
(
    rid SMALLINT PRIMARY KEY IDENTITY(0,20), --will automatically increase the rid by 20
    [name] VARCHAR(100),
    [description] VARCHAR(300),
    isVegan BIT
)

CREATE TABLE Cooking
(
    rid SMALLINT REFERENCES Recipes(rid) --constraint named automatically
        ON UPDATE NO ACTION 
        ON DELETE SET NULL,
    cid SMALLINT, --add foreign key later
    cookingDate DATE,
    quantity int check(quantity > 0),
    rating smallint default(0),

    CONSTRAINT fkey_cooking_chef --constraint named by programmer
        FOREIGN KEY(cid) REFERENCES Chefs(cid)
        ON DELETE SET NULL,
    CONSTRAINT pkey_cooking PRIMARY KEY(rid, cid)
)

ALTER TABLE Cooking DROP CONSTRAINT pkey_cooking

ALTER TABLE Cooking ADD CONSTRAINT pkey_name PRIMARY KEY(cid, rid) 

-- at most one primary key per table
-- allowed to have multiple candidate keys per table (created with the `unique` keyword)

ALTER TABLE Cooking ADD DEFAULT 0 FOR quantity 
