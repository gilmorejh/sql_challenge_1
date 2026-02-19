/*==============================================================
  Purpose:
  This script initializes the foundational dataset for the 
  Danny's Diner customer analytics case study.

  It creates a dedicated schema and supporting dimension and 
  fact tables to simulate transactional restaurant data, 
  including:
      - Customer sales activity
      - Product menu and pricing
      - Loyalty program membership

  The dataset is designed to support exploratory analysis of:
      - Customer purchasing behavior
      - Product popularity and revenue contribution
      - Loyalty program impact on ordering patterns

  This environment will be used for developing SQL-based
  analytical solutions and demonstrating data modeling
  and transformation techniques consistent with modern
  data warehouse practices.
==============================================================*/


IF NOT EXISTS (
    SELECT 1 
    FROM sys.schemas 
    WHERE name = 'dannys_diner'
)
BEGIN
    EXEC('CREATE SCHEMA dannys_diner AUTHORIZATION dbo;');
END
GO


IF OBJECT_ID('dannys_diner.sales', 'U') IS NOT NULL
    DROP TABLE dannys_diner.sales

CREATE TABLE dannys_diner.sales (
  "customer_id" VARCHAR(1),
  "order_date" DATE,
  "product_id" INTEGER
);

TRUNCATE TABLE dannys_diner.sales

INSERT INTO dannys_diner.sales
  ("customer_id", "order_date", "product_id")
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
 
IF OBJECT_ID('dannys_diner.menu', 'U') IS NOT NULL
    DROP TABLE dannys_diner.menu

CREATE TABLE dannys_diner.menu (
  "product_id" INTEGER,
  "product_name" VARCHAR(5),
  "price" INTEGER
);

TRUNCATE TABLE dannys_diner.menu

INSERT INTO dannys_diner.menu
  ("product_id", "product_name", "price")
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');
  

IF OBJECT_ID('dannys_diner.members', 'U') IS NOT NULL
    DROP TABLE dannys_diner.members

CREATE TABLE dannys_diner.members (
  "customer_id" VARCHAR(1),
  "join_date" DATE
);

TRUNCATE TABLE dannys_diner.members

INSERT INTO dannys_diner.members
  ("customer_id", "join_date")
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');
