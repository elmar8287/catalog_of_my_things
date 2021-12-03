CREATE TABLE Label(
  id                INT GENERATED ALWAYS AS IDENTITY,
  title             VARCHAR(100),
  color             VARCHAR(100),
  PRIMARY KEY (id)
);

CREATE TABLE Genre(
  id                INT GENERATED ALWAYS AS IDENTITY,
  name              VARCHAR(100),
  PRIMARY KEY (id)
);

CREATE TABLE Author(
  id                 INT GENERATED ALWAYS AS IDENTITY,
  first_name         VARCHAR(100),
  last_name          VARCHAR(100),
  PRIMARY KEY (id)
);
