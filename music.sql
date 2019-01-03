-- CREATE

CREATE TABLE songs (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  album_id INTEGER,
  artist_id INTEGER,

  FOREIGN KEY(album_id) REFERENCES album(id),
  FOREIGN KEY(artist_id) REFERENCES artist(id)
);

CREATE TABLE albums (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  artist_id INTEGER,

  FOREIGN KEY(artist_id) REFERENCES artist(id)
);

CREATE TABLE artists (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  genre_id INTEGER,

  FOREIGN KEY(genre_id) REFERENCES genre(id)
);

CREATE TABLE genres (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

INSERT INTO
  genres (id, name)
VALUES
  (1, "Pop Rock"),
  (2, "Pop"),
  (3, "K-Pop"),
  (4, "Country");

INSERT INTO
  artists (id, name, genre_id)
VALUES
  (1, "Panic! At The Disco", 1),
  (2, "Ariana Grande", 2),
  (3, "BTS", 3),
  (4, "Florida Georgia Line", 4);

INSERT INTO
  albums (id, name, artist_id)
VALUES
  (1, "Pray For The Wicked", 1),
  (2, "A Fever You Can't Sweat Out", 1),
  (3, "Sweetener", 2),
  (4, "Wings", 3),
  (5, "Anything Goes", 4);

INSERT INTO
  songs (id, name, album_id, artist_id)
VALUES
  -- Pray For the Wicked
  (1, "Say Amen (Saturday Night)", 1, 1),
  (2, "Hey Look Ma, I Made It", 1, 1),
  (3, "High Hopes", 1, 1),
  (4, "Roaring 20s", 1, 1),
  (5, "Dancing's Not A Crime", 1, 1),
  (6, "One Of The Drunks", 1, 1),
  (7, "The Overpass", 1, 1),
  (8, "King of the Clouds", 1, 1),
  (9, "Old Fashioned", 1, 1),
  (10, "Dying In LA", 1, 1),
  -- A Fever You Can't Sweat Out
  (11, "Introduction", 2, 1),
  (12, "The Only Difference Between Martyrdom and Suicide is Press Coverage", 2, 1),
  (13, "London Beckoned Songs About Money Written By Machines", 2, 1),
  (14, "Nails For Breakfast, Tacks For Snacks", 2, 1),
  (15, "Camisado", 2, 1),
  (16, "Time to Dance", 2, 1),
  (17, "Intermission", 2, 1),
  (18, "But It's Better If You Do", 2, 1),
  (19, "I Write Sins Not Tragedies", 2, 1),
  (20, "I Constantly Thank God for Esteban", 2, 1),
  (21, "There's a Good Reason These Tables Are Numbered Honey, You Just Haven't Thought of It Yet", 2, 1),
  (22, "Build God, Then We'll Talk", 2, 1),
  -- Sweetener
  (23, "raindrops (an angel cried)", 3, 2),
  (24, "blazed", 3, 2),
  (25, "the light is coming", 3, 2),
  (26, "R.E.M", 3, 2),
  (27, "God is a woman", 3, 2),
  (28, "sweeter", 3, 2),
  (29, "successful", 3, 2),
  (30, "everytime", 3, 2),
  (31, "breathin", 3, 2),
  (32, "better off", 3, 2),
  (33, "goodnight n go", 3, 2),
  (34, "pete davidson", 3, 2),
  (35, "get well soon", 3, 2),
  -- Wings
  (36, "Blood Sweat & Tears", 4, 3),
  (37, "Begin", 4, 3),
  (38, "Lie", 4, 3),
  (39, "Stigma", 4, 3),
  (40, "First Love", 4, 3),
  (41, "Reflection", 4, 3),
  (42, "MAMA", 4, 3),
  (43, "Awake", 4, 3),
  (44, "Lost", 4, 3),
  (45, "Am I Wrong", 4, 3),
  (46, "21st Century Girl", 4, 3),
  (47, "2! 3!", 4, 3),
  -- Anything Goes
  (48, "Anything Goes", 5, 4),
  (49, "Sun Daze", 5, 4),
  (50, "Good Good", 5, 4),
  (51, "Dirt", 5, 4),
  (52, "Smile", 5, 4),
  (53, "Sippin' On Fire", 5, 4),
  (54, "Smoke", 5, 4),
  (55, "Bumpin' The Night", 5, 4),
  (56, "Angel", 5, 4),
  (57,"Confession", 5, 4),
  (58, "Like You Ain't Even Gone", 5, 4),
  (59, "Every Night", 5, 4);
