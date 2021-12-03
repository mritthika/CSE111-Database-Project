-- user or admin makes an accounts 
insert into user (username, password, user_type) values 
('kelvin_n', 'ilovemarvelsomuch', 'user');

-- user or admin searches for movies under the Iron Man franchise 
select movies.movie_title
from franchise, movies
where franchise.movie_key = movies.movie_key
and franchise.franchise_name = 'Iron Man';

-- user or admin searches for movies under movies that are NOT in a franchise 
select movies.movie_title
from franchise, movies
where franchise.movie_key = movies.movie_key
and franchise.franchise_name = 'Misc';

-- user or admin search for movies released in the year 2021 
select movie_title
from movies
where release_year = '2021';

-- user or admin search for a movie based on the title Black Panther 
select movie_title
from movies
where movie_title = 'Black Panther';

-- user or admin search movie by the movie key for Captain America: Civil War 
select movie_title 
from movies
where movie_key = '0013';

-- user or admin reviews movies (including ratings out of 5 and comments)
insert into reviews (username, movie_title, movie_key, star_rating, comment) values 
    -- admin 
('mritthika_harish','Doctor Strange', '0014', '5', 'SUCH a good movie'),
    -- user 
('sciencebros','Avengers: Age of Ultron', '0011', '4', 'love me some tony and bruce sciencebro action');


-- user or admin creates appointment
insert into appointments (appointment_key, movie_title, movie_key, appointment_date, appointment_time, host, guest) values 
    -- admin    
('1003', 'Shang-Chi and The Legend of The Ten Rings', '0025', '18-11-2021', '2300', 'shivali_aggarwal', 'mritthika_harish'),
    -- user 
('1004', 'Ant-Man', '0012', '22-12-2021', '0500', 'demifan0422', 'princess_shavzz');

-- user or admin cancels appointment
delete from appointments where appointment_key = '1000';

-- user or admin bookmarks movies by the year 2010
select movie_title
from movies
where release_year = '2010';

insert into bookmarked (movie_key, movie_title, franchise, release_year, username) values 
('0003', 'Iron Man 2', 'Iron Man', '2010', 'demifan0422'); 

-- user or admin bookmarks movies by movie key to watch Spider-Man: Far From Home
select movie_title
from movies 
where movie_key = '0023';

insert into bookmarked (movie_key, movie_title, franchise, release_year, username) values
('0023', 'Spider-Man: Far From Home', 'Spiderman', '2019', 'spidermanisdabest');

-- user or admin bookmarks movies by the Guardians of the Galaxy Franchise
select movies.movie_title
from movies, franchise
where franchise.franchise_name = 'Guardians of the Galaxy'
and movies.movie_key = franchise.movie_key
and movies.movie_title = franchise.movie_title;

insert into bookmarked (movie_key, movie_title, franchise, release_year, username) values
('0010', 'Guardians of the Galaxy', 'Guardians of the Galaxy', '2014', 'marvelluver'),
('0015', 'Guardians of the Galaxy Vol. 2', 'Guardians of the Galaxy', '2017', 'marvelluver');

-- user or admin bookmarks movies by title
insert into bookmarked (movie_key, movie_title, release_year, username) values
    -- admin 
('0011', 'Avengers: Age of Ultron', '2015', 'shivali_aggarwal'),
    -- user 
('0023', 'Spider-Man: Far From Home', '2019', 'spidermanisdabest');

-- admin adds the newest series of marvel movies because of the upcoming releases
insert into movies(movie_key, movie_title, release_year, lead_actor) values
('0027','Spider-Man: No Way Home','2021','Tom Holland'),
('0028','Doctor Strange in the Multiverse of Madness','2022','Benedict Cumberbatch'),
('0029','Thor: Love and Thunder','2022','Chris Hemsworth'),
('0030','Black Panther: Wakanda Forever','2022','Letitia Wright'),
('0031','The Marvels','2023','Brie Larson'),
('0032','Blade','TBD','Mahershala Ali'),
('0033','Ant-Man and The Wasp: Quantumania','2023','Paul Rudd'),
('0034','Fantastic Four','TBD','John Krasinski');

-- admin deletes the incredible hulk from the tables because of the many negative reviews

delete from movies where movie_title = 'The Incredible Hulk';
delete from reviews where movie_title = 'The Incredible Hulk';
delete from franchise where movie_title = 'The Incredible Hulk';

-- admin removes black panther from the misc franchise 

delete from franchise where movie_title = 'Black Panther';

--admin adds black panther to a new black panther franchise with the new movie

insert into franchise(movie_key, movie_title, franchise_name) values
('0018', 'Black Panther','Black Panther'),
('0030', 'Black Panther: Wakanda Forever', 'Black Panther');

--admin removes captain marvel from the misc franchise 

delete from franchise where movie_title = 'Captain Marvel';

--admin adds captain marvel to a new captain marvel franchise with the new movie

insert into franchise(movie_key, movie_title, franchise_name) values
('0021', 'Captain Marvel','Captain Marvel'),
('0031', 'The Marvels','Captain Marvel');


-- admin updates franchise table 
insert into franchise (movie_key, movie_title, franchise_name) values
('0027', 'Spider-Man: No Way Home','Spider Man'),
('0028','Doctor Strange in the Multiverse of Madness','Doctor Strange'),
('0029','Thor: Love and Thunder','Thor'),
('0033','Ant-Man and The Wasp: Quantumania','Ant-Man');

--admin finds the number of movies that have at least two films
select count(at_least_two)
from (select count(distinct franchise.franchise_name) as at_least_two
      from movies, franchise
      where movies.movie_key = franchise.movie_key
      group by movies.movie_key
      having count(franchise.franchise_name) <= 2);


-- finding users that have previously participated in an appointment in this database
select user.username
from appointments, user
where user.username = appointments.host
or user.username = appointments.guest
and appointments.appointment_key = (select count(appointments.appointment_key)
from appointments, movies
where movies.movie_title = appointments.movie_title)
order by appointments.host;