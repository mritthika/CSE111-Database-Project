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

-- add in table user_appt (a connection between user and appointment)
CREATE TABLE user_appt(
    host                text,
    guest               text,
    appointment_key     integer,
    appointment_date    text,
    appointment_time    datetime
);

INSERT INTO user_appt (host, guest, appointment_key, appointment_date, appointment_time) VALUES 
('mritthika_harish', 'shivali_aggarwal', '1000', '26-11-2021', '0900'),
('sciencebros', 'brucebanner', '1001', '12-12-2021', '2300'),
('marvelluver', 'sindhubijj1120', '1002', '20-11-2021', '1800');


CREATE TABLE appointments (
    appointment_key         integer,
    movie_title             text,
    movie_key               integer,
    appointment_date        text, 
    appointment_time        datetime,
    host                    text,
    guest                   text
);

INSERT INTO appointments (appointment_key, movie_title, movie_key, appointment_date, appointment_time, host, guest) VALUES
('1000', 'Iron Man', '0001', '26-11-2021', '0900', 'mritthika_harish', 'shivali_aggarwal'),
('1001', 'Avengers: Age of Ultron', '0011', '12-12-2021', '2300', 'sciencebros', 'brucebanner'),
('1002', 'Black Panther', '0018', '20-11-2021', '1800', 'marvelluver', 'sindhubijj1120');

-- insert another table here - users and movies
CREATE TABLE user_movies(
    username            text,
    movie_key_one       int,
    movie_title_one     text,
    movie_key_two       text,
    movie_title_two     text
);

INSERT INTO user_movies(username, movie_key_one, movie_title_one, movie_key_two, movie_title_two) VALUES
('sciencebros', '0006','The Avengers', '0007','Iron Man 3'),
('shivali_aggarwal','0014','Doctor Strange', '0005', 'Captain America: The First Avenger'),
('spidermanisdabest','0016','Spider-Man: Homecoming', '0023', 'Spider-Man: Far From Home' ),
('iheartchrisx3', '0017','Thor: Ragnarok', '0009','Captain America: The Winter Soldier');

CREATE TABLE movies (
    movie_key       int,
    movie_title     text,
    release_year    varchar(4),
    lead_actor      text
);
-- insert movie key 
INSERT INTO movies(movie_key, movie_title, release_year, lead_actor) VALUES
('0001','Iron Man','2008','Robert Downey Jr.'),
('0002', 'The Incredible Hulk', '2008', 'Edward Norton'),
('0003','Iron Man 2', '2010', 'Robery Downey Jr.'),
('0004','Thor', '2011', 'Chris Hemsworth'),
('0005','Captain America: The First Avenger', '2011', 'Chris Evans'),
('0006','The Avengers', '2012', 'Robert Downey Jr.'),
('0007','Iron Man 3', '2013', 'Robert Downey Jr.'),
('0008','Thor: The Dark World', '2013', 'Chris Hemsworth'),
('0009','Captain America: The Winter Soldier', '2014', 'Chris Evans'),
('0010','Guardians of the Galaxy', '2014', 'Chris Pratt'),
('0011','Avengers: Age of Ultron', '2015', 'Robert Downey Jr.'),
('0012','Ant-Man', '2015', 'Paul Rudd'),
('0013','Captain America: Civil War', '2016', 'Chris Evans'),
('0014','Doctor Strange', '2016', 'Benedict Cumberbatch'),
('0015','Guardians of the Galaxy Vol. 2', '2017', 'Chris Pratt'),
('0016','Spider-Man: Homecoming', '2017', 'Tom Holland'),
('0017','Thor: Ragnarok', '2017', 'Chris Hemsworth'),
('0018','Black Panther', '2018', 'Chadwick Boseman'),
('0019','Avengers: Infinity War', '2018', 'Robert Downey Jr.'),
('0020','Ant-Man and The Wasp', '2018', 'Paul Rudd'),
('0021','Captain Marvel', '2019', 'Brie Larson'),
('0022','Avengers: Endgame', '2019', 'Robert Downey Jr.'),
('0023','Spider-Man: Far From Home', '2019', 'Tom Holland'),
('0024','Black Widow', '2021', 'Scarlett Johansson'),
('0025','Shang-Chi and The Legend of The Ten Rings', '2021', 'Simu Liu'),
('0026','Eternals', '2021', 'Gemma Chan');


CREATE TABLE reviews (
    username        text,
    movie_title     text,
    movie_key       integer,
    star_rating     integer,
    comment         text
);

INSERT INTO reviews(username, movie_title, movie_key, star_rating, comment) VALUES
('mritthika_harish','Iron Man', '0001', '4', 'Great Movie!'),
('shivali_aggarwal', 'Shang-Chi and The Legend of The Ten Rings', '0025', '5', 'Excellent'),
('sindhubijj1120', 'Eternals', '0026', '4', 'Loved the Diverse Cast!'),
('demifan0422', 'Thor', '0004', '2', 'Quite a Boring Movie. Do not Reccommend'),
('princess_shavzz', 'Black Widow', '0024', '1', 'If I was Scarlett I would also sue Disney'),
('marvelluver', 'Black Panther', '0018', '5','Loved the representation!!'),
('marvelluver', 'Eternals', '0026', '5','Give Karun a raise!'),
('brucebanner', 'The Incredible Hulk','0002', '1','If I could give this movie a 0, I would. Why is this still in a Marvel Database.'),
('spidermanisdabest', 'Spider-Man: Far From Home', '0023', '5','dont know if i want to be tom holland or zendaya'),
('iheartchrisx3', 'Thor', '0004', '4','OMG CHRIS HEMSWORTH!');


CREATE TABLE bookmarked (
    movie_key       int,
    movie_title     text,
    franchise       text,
    release_year    varchar(5),
    username        text
);

INSERT INTO bookmarked (movie_key, movie_title, franchise, release_year, username) VALUES
('0025', 'Shang-Chi and The Legend of The Ten Rings', 'Misc', '2021', 'sindhubijj1120'),
('0005','Captain America: The First Avenger','Captain America', '2011', 'sindhubijj1120'),
('0018','Black Panther','Misc', '2018', 'sindhubijj1120'),
('0026', 'Eternals', 'Misc', '2021', 'sindhubijj1120'),
('0004', 'Thor', 'Thor', '2011', 'iheartchrisx3'),
('0008', 'Thor: The Dark World', 'Thor', '2013', 'iheartchrisx3'),
('0017', 'Thor: Ragnarok', 'Thor', '2017', 'iheartchrisx3'),
('0005','Captain America: The First Avenger', 'Captain America', '2011', 'marvelluver'),
('0006', 'The Avengers','Avengers', '2012', 'princess_shavzz'),
('0008','Thor: The Dark World','Thor', '2013', 'demifan0422'),
('0025', 'Shang-Chi and The Legend of The Ten Rings', 'Misc', '2021', 'brucebanner');



CREATE TABLE franchise (
    movie_key       int,
    movie_title     text,
    franchise_name  text
);

INSERT INTO franchise(movie_key, movie_title, franchise_name) VALUES
-- IRON MAN
('0001', 'Iron Man','Iron Man'),
('0003', 'Iron Man 2', 'Iron Man'),
('0007', 'Iron Man 3', 'Iron Man'),
-- CAPTAIN AMERICA
('0005', 'Captain America: The First Avenger', 'Captain America'),
('0009', 'Captain America: The Winter Soldier', 'Captain America'),
('0013', 'Captain America: Civil War', 'Captain America'),
-- AVENGERS
('0006', 'The Avengers', 'Avengers'),
('0011','Avengers: Age of Ultron', 'Avengers'),
('0019','Avengers: Infinity War', 'Avengers'),
('0022','Avengers: Endgame', 'Avengers'),
-- GUARDIANS OF THE GALAXY
('0010', 'Guardians of the Galaxy', 'Guardians of the Galaxy'),
('0015', 'Guardians of the Galaxy Vol. 2', 'Guardians of the Galaxy'),
-- ANT-MAN
('0012', 'Ant-Man', 'Ant-Man'),
('0020', 'Ant-Man and The Wasp', 'Ant-Man'),
-- SPIDER-MAN
('0016','Spider-Man: Homecoming', 'Spider-Man'),
('0023','Spider-Man: Far From Home', 'Spider-Man'),
-- DR. STRANGE
('0014', 'Doctor Strange', 'Dr. Strange'),
-- THOR
('0004','Thor', 'Thor'),
('0008', 'Thor: The Dark World', 'Thor'),
('0017', 'Thor: Ragnarok', 'Thor'),
-- MISC
('0002', 'The Incredible Hulk', 'Misc'),
('0018', 'Black Panther', 'Misc'),
('0021','Captain Marvel', 'Misc'),
('0024','Black Widow', 'Misc'),
('0025','Shang-Chi and The Legend of The Ten Rings', 'Misc'),
('0026', 'Eternals', 'Misc');