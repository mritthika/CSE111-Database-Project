drop table if exists movies;
drop table if exists actors;
drop table if exists franchise;
drop table if exists franchise_actor;
drop table if exists actors_movies;
drop table if exists genre;
drop table if exists genre_movies;
drop table if exists reviews;

CREATE TABLE movies (
    movie_title         text,
    release_year        varchar(4),
    lead_actor          text,
    supporting_actor    text,
    side_actor          text,
    franchise           text
);

INSERT INTO movies(movie_title, release_year, lead_actor, supporting_actor, side_actor, franchise) VALUES
('Iron Man','2008','Robert Downey Jr.', 'Gwyeneth Paltrow', 'Jon Favreau', 'Iron Man'),
('The Incredible Hulk', '2008', 'Edward Norton', 'Lou Ferrigno', 'Liv Tyler', 'Misc'),
('Iron Man 2', '2010', 'Robert Downey Jr.', 'Gwyeneth Paltrow', 'Jon Favreau', 'Iron Man'),
('Thor', '2011', 'Chris Hemsworth', 'Tom Hiddleston', 'Natalie Portman', 'Thor'),
('Captain America: The First Avenger', '2011', 'Chris Evans', 'Sebastian Stan', 'Hayley Atwell', 'Captain America'),
('The Avengers', '2012', 'Robert Downey Jr.', 'Chris Evans', 'Scarlett Johansson', 'Avengers'),
('Iron Man 3', '2013', 'Robert Downey Jr.', 'Gwyeneth Paltrow', 'Jon Favreau', 'Iron Man'),
('Thor: The Dark World', '2013', 'Chris Hemsworth', 'Tom Hiddleston', 'Natalie Portman', 'Thor'),
('Captain America: The Winter Soldier', '2014', 'Chris Evans', 'Sebastian Stan', 'Anthony Mackie', 'Captain America'),
('Guardians of the Galaxy', '2014', 'Chris Pratt', 'Dave Bautista', 'Zoe Saldana', 'Guardians of the Galaxy'),
('Avengers: Age of Ultron', '2015', 'Robert Downey Jr.', 'Chris Evans', 'Chris Hemsworth', 'Avengers'),
('Ant-Man', '2015', 'Paul Rudd', 'Evangeline Lilly', 'Michael Douglas', 'Ant-Man'),
('Captain America: Civil War', '2016', 'Chris Evans', 'Robert Downey Jr.', 'Sebastian Stan', 'Captain America'),
('Doctor Strange', '2016', 'Benedict Cumberbatch', 'Tilda Swinton', 'Benedict Wong', 'Doctor Strange'),
('Guardians of the Galaxy Vol. 2', '2017', 'Chris Pratt', 'Dave Bautista', 'Zoe Saldana', 'Guardians of the Galaxy'),
('Spider-Man: Homecoming', '2017', 'Tom Holland', 'Zendaya', 'Jacob Batalon', 'Spider-Man'),
('Thor: Ragnarok', '2017', 'Chris Hemsworth', 'Tom Hiddleston', 'Cate Blanchett', 'Thor'),
('Black Panther', '2018', 'Chadwick Boseman', 'Lupita Nyongo', 'Michael B. Jordan', 'Misc'),
('Avengers: Infinity War', '2018', 'Robert Downey Jr.', 'Chris Evans', 'Tom Holland', 'Avengers'),
('Ant-Man and The Wasp', '2018', 'Paul Rudd', 'Evangeline Lilly', 'Michael Douglas', 'Ant-Man'),
('Captain Marvel', '2019', 'Brie Larson', 'Samuel L. Jackson', 'Gemma Chan', 'Misc'),
('Avengers: Endgame', '2019', 'Robert Downey Jr.', 'Scarlett Johansson', 'Brie Larson', 'Avengers'),
('Spider-Man: Far From Home', '2019', 'Tom Holland', 'Zendaya', 'Jacob Batalon', 'Spider-Man'),
('Black Widow', '2021', 'Scarlett Johansson', 'Florence Pugh', 'Rachel Weisz', 'Misc'),
('Shang-Chi and The Legend of The Ten Rings', '2021', 'Simu Liu', 'Awkwafina', 'Tony Leung Chiu-Wai', 'Misc'),
('Eternals', '2021', 'Gemma Chan', 'Richard Madden', 'Kumail Nanjiani', 'Misc');

CREATE TABLE actors_movies (
    actors_name     text,
    movie_title     text
);
INSERT INTO actors_movies(actors_name, movie_title) VALUES
('Robert Downey Jr.', 'Iron Man'),
('Robert Downey Jr.', 'Iron Man 2'),
('Robert Downey Jr.', 'The Avengers'),
('Robert Downey Jr.', 'Iron Man 3'),
('Robert Downey Jr.', 'Avengers: Age of Ultron'),
('Robert Downey Jr.', 'Captain America: Civil War'),
('Robert Downey Jr.', 'Avengers: Infinity War'),
('Robert Downey Jr.', 'Avengers: Endgame'),
('Gwyeneth Paltrow', 'Iron Man'),
('Gwyeneth Paltrow','Iron Man 2'),
('Gwyeneth Paltrow','Iron Man 3'),
('Jon Favreau', 'Iron Man'),
('Jon Favreau', 'Iron Man 2'),
('Jon Favreau', 'Iron Man 3'),
('Edward Norton', 'The Incredible Hulk'),
('Lou Ferrigno', 'The Incredible Hulk'),
('Liv Tyler', 'The Incredible Hulk'),
('Chris Hemsworth', 'Thor'),
('Chris Hemsworth', 'Thor: The Dark World'),
('Chris Hemsworth', 'Avengers: Age of Ultron'),
('Chris Hemsworth', 'Thor: Ragnarok'),
('Tom Hiddleston', 'Thor'),
('Tom Hiddleston', 'Thor: The Dark World'),
('Tom Hiddleston', 'Thor: Ragnarok'),
('Natalie Portman', 'Thor'),
('Natalie Portman', 'Thor: The Dark World'),
('Chris Evans', 'Captain America: The First Avenger'),
('Chris Evans', 'The Avengers'),
('Chris Evans', 'Captain America: The Winter Soldier'),
('Chris Evans', 'Avengers: Age of Ultron'),
('Chris Evans', 'Captain America: Civil War'),
('Chris Evans', 'Avengers: Infinity War'),
('Sebastian Stan', 'Captain America: The First Avenger'),
('Sebastian Stan', 'Captain America: The Winter Soldier'),
('Sebastian Stan', 'Captain America: Civil War'),
('Hayley Atwell', 'Captain America: The First Avenger'),
('Scarlett Johansson', 'The Avengers'),
('Scarlett Johansson', 'Avengers: Endgame'),
('Scarlett Johansson', 'Black Widow'),
('Anthony Mackie', 'Captain America: The Winter Soldier'),
('Chris Pratt', 'Guardians of the Galaxy'),
('Chris Pratt','Guardians of the Galaxy Vol. 2'),
('Dave Bautista', 'Guardians of the Galaxy'),
('Dave Bautista','Guardians of the Galaxy Vol. 2'),
('Zoe Saldana', 'Guardians of the Galaxy'),
('Zoe Saldana','Guardians of the Galaxy Vol. 2'),
('Paul Rudd','Ant-Man'),
('Paul Rudd','Ant-Man and The Wasp'),
('Evangeline Lilly','Ant-Man'),
('Evangeline Lilly','Ant-Man and The Wasp'),
('Michael Douglas','Ant-Man'),
('Michael Douglas','Ant-Man and The Wasp'),
('Benedict Cumberbatch', 'Doctor Strange'),
('Tilda Swinton', 'Doctor Strange'),
('Benedict Wong','Doctor Strange'),
('Tom Holland', 'Spider-Man: Homecoming'),
('Tom Holland', 'Avengers: Infinity War'),
('Tom Holland', 'Spider-Man: Far From Home'),
('Zendaya', 'Spider-Man: Homecoming'),
('Zendaya', 'Spider-Man: Far From Home'),
('Jacob Batalon', 'Spider-Man: Homecoming'),
('Jacob Batalon', 'Spider-Man: Far From Home'),
('Chadwick Boseman', 'Black Panther'),
('Lupita Nyongo', 'Black Panther'),
('Michael B. Jordan', 'Black Panther'),
('Brie Larson', 'Captain Marvel'),
('Brie Larson', 'Avengers: Endgame'),
('Samuel L. Jackson', 'Captain Marvel'),
('Gemma Chan','Captain Marvel'),
('Gemma Chan', 'Eternals'),
('Rachel Weisz', 'Black Widow'),
('Florence Pugh', 'Black Widow'),
('Simu Liu', 'Shang-Chi and The Legend of The Ten Rings'),
('Awkwafina', 'Shang-Chi and The Legend of The Ten Rings'),
('Tony Leung Chiu-Wai', 'Shang-Chi and The Legend of The Ten Rings'),
('Richard Madden', 'Eternals'),
('Kumail Nanjiani', 'Eternals');


CREATE TABLE genre_movies (
    movie_title     text,
    genre           text
);
INSERT INTO genre_movies(movie_title, genre) VALUES
('Iron Man', 'Action'),
('Iron Man', 'Adventure'),
('The Incredible Hulk', 'Action'),
('Iron Man 2', 'Action'),
('Iron Man 2', 'Romance'),
('Thor', 'Action'),
('Thor', 'Fantasy'),
('Captain America: The First Avenger', 'Action'),
('The Avengers', 'Comedy'),
('The Avengers', 'Action'),
('Iron Man 3', 'Action'),
('Iron Man 3', 'Comedy'),
('Thor: The Dark World', 'Action'),
('Thor: The Dark World', 'Fantasy'),
('Captain America: The Winter Soldier', 'Action'),
('Captain America: The Winter Soldier', 'Science Fiction'),
('Guardians of the Galaxy', 'Action'),
('Guardians of the Galaxy', 'Comedy'),
('Avengers: Age of Ultron', 'Action'),
('Avengers: Age of Ultron', 'Adventure'),
('Ant-Man', 'Science Fiction'),
('Ant-Man', 'Comedy'),
('Captain America: Civil War', 'Science Fiction'),
('Captain America: Civil War', 'Action'),
('Doctor Strange', 'Action'),
('Doctor Strange', 'Fantasy'),
('Guardians of the Galaxy Vol. 2', 'Comedy'),
('Guardians of the Galaxy Vol. 2', 'Action'),
('Spider-Man: Homecoming', 'Action'),
('Spider-Man: Homecoming', 'Comedy'),
('Thor: Ragnarok', 'Comedy'),
('Thor: Ragnarok', 'Action'),
('Thor: Ragnarok', 'Fantasy'),
('Black Panther', 'Action'),
('Black Panther', 'Science Fiction'),
('Avengers: Infinity War', 'Action'),
('Avengers: Infinity War', 'Science Fiction'),
('Ant-Man and The Wasp', 'Action'),
('Ant-Man and The Wasp', 'Comedy'),
('Captain Marvel', 'Action'),
('Captain Marvel', 'Science Fiction'),
('Avengers: Endgame','Action'),
('Avengers: Endgame','Adventure'),
('Spider-Man: Far From Home', 'Action'),
('Spider-Man: Far From Home', 'Comedy'),
('Black Widow', 'Action'),
('Black Widow', 'Thriller'),
('Shang-Chi and The Legend of The Ten Rings', 'Fantasy'),
('Shang-Chi and The Legend of The Ten Rings', 'Action'),
('Eternals', 'Action'),
('Eternals', 'Fantasy');

drop table if exists bookmarked;

CREATE TABLE bookmarked (
    movie_title     text,
    lead_actor      text,
    franchise       text,
    release_year    varchar(5)
);

INSERT INTO bookmarked (movie_title, lead_actor, franchise, release_year) VALUES
('Shang-Chi and The Legend of The Ten Rings', 'Simu Liu', 'Misc', '2021');


CREATE TABLE franchise (
    franchise_name      text
);
INSERT INTO franchise(franchise_name) VALUES
-- IRON MAN
('Iron Man'),
-- CAPTAIN AMERICA
('Captain America'),
-- AVENGERS
('Avengers'),
-- GUARDIANS OF THE GALAXY
('Guardians of the Galaxy'),
-- ANT-MAN
('Ant-Man'),
-- SPIDER-MAN
('Spider-Man'),
-- DR. STRANGE
('Doctor Strange'),
-- THOR
('Thor'),
-- MISC
('Misc');

CREATE TABLE franchise_actor (
    actor_name       text,
    franchise        text
);
INSERT INTO franchise_actor(actor_name, franchise) VALUES
('Robert Downey Jr.', 'Iron Man'),
('Robert Downey Jr.', 'Avengers'),
('Robert Downey Jr.', 'Captain America'),
('Gwyeneth Paltrow', 'Iron Man'),
('Jon Favreau', 'Iron Man'),
('Edward Norton', 'Misc'),
('Lou Ferrigno', 'Misc'),
('Liv Tyler', 'Misc'),
('Chris Hemsworth', 'Thor'),
('Chris Hemsworth', 'Avengers'),
('Tom Hiddleston', 'Thor'),
('Natalie Portman',  'Thor'),
('Chris Evans', 'Captain America'),
('Chris Evans', 'Avengers'),
('Sebastian Stan', 'Captain America'),
('Hayley Atwell', 'Captain America'),
('Scarlett Johansson', 'Avengers'),
('Scarlett Johansson', 'Misc' ),
('Anthony Mackie', 'Captain America'),
('Chris Pratt', 'Guardians of the Galaxy'),
('Dave Bautista', 'Guardians of the Galaxy'),
('Zoe Saldana', 'Guardians of the Galaxy'),
('Paul Rudd', 'Ant-Man'),
('Evangeline Lilly','Ant-Man'),
('Michael Douglas', 'Ant-Man'),
('Benedict Cumberbatch', 'Doctor Strange'),
('Tilda Swinton', 'Doctor Strange'),
('Benedict Wong', 'Doctor Strange'),
('Tom Holland', 'Spider-Man'),
('Tom Holland', 'Avengers'),
('Zendaya', 'Spider-Man'),
('Jacob Batalon',  'Spider-Man'),
('Chadwick Boseman', 'Misc'),
('Lupita Nyongo', 'Misc'),
('Michael B. Jordan', 'Misc'),
('Brie Larson', 'Misc'),
('Brie Larson', 'Avengers'),
('Samuel L. Jackson', 'Misc'),
('Gemma Chan', 'Misc'),
('Rachel Weisz', 'Misc'),
('Florence Pugh', 'Misc'),
('Simu Liu', 'Misc'),
('Awkwafina', 'Misc'),
('Tony Leung Chiu-Wai', 'Misc'),
('Richard Madden', 'Misc'),
('Kumail Nanjiani', 'Misc');


CREATE TABLE genre (
    genre       text
);
INSERT INTO genre(genre) VALUES
('Action'),
('Adventure' ),
('Romance'),
('Fantasy'),
('Comedy'),
('Science Fiction'),
('Thriller');

CREATE TABLE actors (
    actor_name      text
);
INSERT INTO actors(actor_name) VALUES 
('Robert Downey Jr.'),
('Gwyeneth Paltrow'),
('Jon Favreau'),
('Edward Norton'),
('Lou Ferrigno'),
('Liv Tyler'),
('Chris Hemsworth'),
('Tom Hiddleston'),
('Natalie Portman'),
('Chris Evans'),
('Sebastian Stan'),
('Hayley Atwell'),
('Scarlett Johansson'),
('Anthony Mackie'),
('Chris Pratt'),
('Dave Bautista'),
('Zoe Saldana'),
('Paul Rudd'),
('Evangeline Lilly'),
('Michael Douglas'),
('Benedict Cumberbatch'),
('Tilda Swinton'),
('Benedict Wong'),
('Tom Holland'),
('Zendaya'),
('Jacob Batalon'),
('Chadwick Boseman'),
('Lupita Nyongo'),
('Michael B. Jordan'),
('Brie Larson'),
('Samuel L. Jackson'),
('Gemma Chan'),
('Rachel Weisz'),
('Florence Pugh'),
('Simu Liu'),
('Awkwafina'),
('Tony Leung Chiu-Wai'),
('Richard Madden'),
('Kumail Nanjiani');

CREATE TABLE reviews (
    movie_title     text,
    star_rating     int,
    comment         text
);

INSERT INTO reviews(movie_title, star_rating, comment) VALUES
('Iron Man', '4', 'Great Movie!');