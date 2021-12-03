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

CREATE TABLE Book(
  id                INT GENERATED ALWAYS AS IDENTITY,
  label_id          INT,
  publish_date      DATE,
  archived          BOOLEAN,
  publisher         VARCHAR(100),
  cover_state       VARCHAR(100),
  PRIMARY KEY (id),
  FOREIGN KEY (label_id) REFERENCES Label(id)
);

CREATE TABLE MusicAlbum(
  id                INT GENERATED ALWAYS AS IDENTITY,
  genre_id          INT,
  publish_date      DATE,
  archived          BOOLEAN,
  on_spotify        BOOLEAN,
  PRIMARY KEY (id),
  FOREIGN KEY (genre_id) REFERENCES Genre(id)
);

CREATE TABLE Game(
  id                INT GENERATED ALWAYS AS IDENTITY,
  author_id         INT,
  publish_date      DATE,
  archived          BOOLEAN,
  last_played       BOOLEAN,
  multiplayer       BOOLEAN,
  PRIMARY KEY (id),
  FOREIGN KEY (author_id) REFERENCES Author(id)
);
