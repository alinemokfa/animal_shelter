DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;

CREATE TABLE owners(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  address VARCHAR(255) not null,
  email_address VARCHAR(255),
  phone_number INT8
);

CREATE TABLE animals(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  type VARCHAR(255),
  breed VARCHAR(255),
  admission_date DATE DEFAULT CURRENT_DATE,
  adoption_status BOOLEAN NOT NULL,
  image_url VARCHAR(1024),
  owner_id INT8 REFERENCES owners(id)
);
