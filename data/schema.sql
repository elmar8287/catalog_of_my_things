CREATE TABLE Label(
  id                BIGSERIAL PRIMARY KEY,
  title             VARCHAR(100),
  color             VARCHAR(100),
  PRIMARY KEY (id)
);

CREATE TABLE Genre(
  id                BIGSERIAL PRIMARY KEY,
  name              VARCHAR(100),
  PRIMARY KEY (id)
);

CREATE TABLE Author(
  id                 BIGSERIAL PRIMARY KEY,
  first_name         VARCHAR(100),
  last_name          VARCHAR(100),
  PRIMARY KEY (id)
);

CREATE TABLE Book(
  id               BIGSERIAL PRIMARY KEY,
  label_id         INT,
  genre_id         INT,
  author_id        INT,
  publish_date      DATE,
  archived          BOOLEAN,
  publisher         VARCHAR(100),
  cover_state       VARCHAR(100),
  PRIMARY KEY (id),
  FOREIGN KEY (label_id) REFERENCES Label(id)
);

CREATE TABLE MusicAlbum(
  id                BIGSERIAL PRIMARY KEY,
  genre_id          INT,
  author_id         INT,
  label_id          INT,
  publish_date      DATE,
  archived          BOOLEAN,
  on_spotify        BOOLEAN,
  PRIMARY KEY (id),
  FOREIGN KEY (genre_id) REFERENCES Genre(id),
  FOREIGN KEY(author_id) REFERENCES author(id),
  FOREIGN KEY(label_id) REFERENCES label(id)
);

CREATE TABLE Game(
  id                BIGSERIAL PRIMARY KEY,
  author_id         INT,
  genre_id          INT,
  last_played_at    DATE,
  publish_date      DATE,
  archived          BOOLEAN,
  label_id          INT,
  multiplayer       BOOLEAN,
  PRIMARY KEY (id),
  FOREIGN KEY(genre_id) REFERENCES genre(id),
  FOREIGN KEY (author_id) REFERENCES Author(id),
  FOREIGN KEY(label_id) REFERENCES label(id)
);
