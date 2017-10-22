DROP TABLE IF EXISTS animals;

CREATE TABLE animals (
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  type VARCHAR(255),
  breed VARCHAR(255),
  admission_date DATE DEFAULT CURRENT_DATE,
  adoption_status VARCHAR(255),
  image_url VARCHAR(1024),
  adopted TEXT
);