CREATE TABLE user (
    username     text, 
    password     varchar(255),
    user_type    text
);

INSERT INTO user(username, password, user_type) VALUES
('shivali_aggarwal', '12345678', 'Admin'),
('mritthika_harish', 'thisismypassword', 'Admin'),
('sindhubijj1120', 'West_Youth_35_Dream_Line', 'User'),
('demifan0422', 'password', 'User'),
('princess_shavzz', '68.Emotion.Personal', 'User'),
('marvelluver', '15_Aside_Hurry_Regular', 'User'),
('iheartchrisx3', 'Check_93_Drag_Debate', 'User'),
('spidermanisdabest', 'Duty.Student.61.Habit', 'User'),
('brucebanner', 'Kiss_44_Lawyer_Internal', 'User'),
('sciencebros', '81_Gather_Transition', 'User');


CREATE TABLE appointments (
    movie_title             text,
    appointment_date        text, 
    appointment_time        datetime,
    host                    text,
    guest                   text
);

INSERT INTO appointments (movie_title, appointment_date, appointment_time, host, guest) VALUES
('Iron Man', '26-11-2021', '0900', 'mritthika_harish', 'shivali_aggarwal'),
('Avengers: Age of Ultron', '12-12-2021', '2300', 'sciencebros', 'brucebanner'),
('Black Panther', '20-11-2021', '1800', 'marvelluver', 'sindhubijj1120');


CREATE TABLE movies (
    movie_key       int,
    movie_title     text,
    year            varchar(4),
    lead_actor      text
);
-- insert movie key 
INSERT INTO movies(movie_key, movie_title, year, lead_actor) VALUES
('Iron Man','2008','Robert Downey Jr.'),
('The Incredible Hulk', '2008', 'Edward Norton'),
('Iron Man 2', '2010', 'Robery Downey Jr.'),
('Thor', '2011', 'Chris Hemsworth'),
('Captain America: The First Avenger', '2011', 'Chris Evans'),
('The Avengers', '2012', 'Robert Downey Jr.'),
('Iron Man 3', '2013', 'Robert Downey Jr.'),
('Thor: The Dark World', '2013', 'Chris Hemsworth'),
('Captain America: The Winter Soldier', '2014', 'Chris Evans'),
('Guardians of the Galaxy', '2014', 'Chris Pratt'),
('Avengers: Age of Ultron', '2015', 'Robert Downey Jr.'),
('Ant-Man', '2015', 'Paul Rudd'),
('Captain America: Civil War', '2016', 'Chris Evans'),
('Doctor Strange', '2016', 'Benedict Cumberbatch'),
('Guardians of the Galaxy Vol. 2', '2017', 'Chris Pratt'),
('Spider-Man: Homecoming', '2017', 'Tom Holland'),
('Thor: Ragnarok', '2017', 'Chris Hemsworth'),
('Black Panther', '2018', 'Chadwick Boseman'),
('Avengers: Infinity War', '2018', 'Robert Downey Jr.'),
('Ant-Man and The Wasp', '2018', 'Paul Rudd'),
('Captain Marvel', '2019', 'Brie Larson'),
('Avengers: Endgame', '2019', 'Robert Downey Jr.'),
('Spider-Man: Far From Home', '2019', 'Tom Holland'),
('Black Widow', '2021', 'Scarlett Johansson'),
('Shang-Chi and The Legend of The Ten Rings', '2021', 'Simu Liu'),
('Eternals', '2021', 'Gemma Chan');



CREATE TABLE reviews (
    username        text,
    movie_title     text,
    star_rating     integer,
    comment         text
);

INSERT INTO reviews(username, movie_title, star_rating, comment) VALUES
('mritthika_harish','Iron Man', '4', 'Great Movie!'),
('shivali_aggarwal', 'Shang-Chi and The Legend of The Ten Rings', '5', 'Excellent'),
('sindhubijj1120', 'Eternals', '4', 'Loved the Diverse Cast!'),
('demifan0422', 'Thor', '2', 'Quite a Boring Movie. Do not Reccommend'),
('princess_shavzz', 'Black Widow', '1', 'If I was Scarlett I would also sue Disney'),
('marvelluver', 'Black Panther','5','Loved the representation!!'),
('marvelluver', 'Eternals','5','Give Karun a raise!'),
('brucebanner', 'The Incredible Hulk','1','If I could give this movie a 0, I would. Why is this still in a Marvel Database.'),
('spidermanisdabest', 'Spider-Man: Far From Home','5','dont know if i want to be tom holland or zendaya'),
('iheartchrisx3', 'Thor','4','OMG CHRIS HEMSWORTH!');


CREATE TABLE bookmarked (
    movie_key       int,
    movie_title     text,
    release_year    varchar(5),
    username        text,
    franchise       text
);
--insert movie key, franchise
INSERT INTO bookmarked (movie_key, movie_title, release_year, username) VALUES
('Shang-Chi and The Legend of The Ten Rings', '2021', 'sindhubijj1120'),
('Captain America: The First Avenger', '2011', 'sindhubijj1120'),
('Black Panther', '2018', 'sindhubijj1120'),
('Eternals', '2021', 'sindhubijj1120'),
('Thor', '2011', 'iheartchrisx3'),
('Thor: The Dark World', '2013', 'iheartchrisx3'),
('Thor: Ragnarok', '2017', 'iheartchrisx3'),
('Captain America: The First Avenger', '2011', 'marvelluver'),
('The Avengers', '2012', 'princess_shavzz'),
('Thor: The Dark World', '2013', 'demifan0422'),
('Shang-Chi and The Legend of The Ten Rings', '2021', 'brucebanner');


CREATE TABLE franchise (
    movie_title     text,
    franchise_name  text
);

INSERT INTO franchise(movie_title, franchise_name) VALUES
-- IRON MAN
('Iron Man','Iron Man'),
('Iron Man 2', 'Iron Man'),
('Iron Man 3', 'Iron Man'),
-- CAPTAIN AMERICA
('Captain America: The First Avenger', 'Captain America'),
('Captain America: The Winter Soldier', 'Captain America'),
('Captain America: Civil War', 'Captain America'),
-- AVENGERS
('The Avengers', 'Avengers'),
('Avengers: Age of Ultron', 'Avengers'),
('Avengers: Infinity War', 'Avengers'),
('Avengers: Endgame', 'Avengers'),
-- GUARDIANS OF THE GALAXY
('Guardians of the Galaxy', 'Guardians of the Galaxy'),
('Guardians of the Galaxy Vol. 2', 'Guardians of the Galaxy'),
-- ANT-MAN
('Ant-Man', 'Ant-Man'),
('Ant-Man and The Wasp', 'Ant-Man'),
-- SPIDER-MAN
('Spider-Man: Homecoming', 'Spider-Man'),
('Spider-Man: Far From Home', 'Spider-Man'),
-- DR. STRANGE
('Doctor Strange', 'Dr. Strange'),
-- THOR
('Thor', 'Thor'),
('Thor: The Dark World', 'Thor'),
('Thor: Ragnarok', 'Thor'),
-- MISC
('The Incredible Hulk', 'Misc'),
('Black Panther', 'Misc'),
('Captain Marvel', 'Misc'),
('Black Widow', 'Misc'),
('Shang-Chi and The Legend of The Ten Rings', 'Misc'),
('Eternals', 'Misc');
