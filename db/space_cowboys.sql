DROP TABLE;

CREATE TABLE space_cowboys (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  danger_level VARCHAR(255),
  homeworld VARCHAR(255),
  favourite_weapon VARCHAR(255)
);
