CREATE TABLE user (
    username    text 
    password    varchar(8)
    user_toe    text
);

CREATE TABLE appointments (
    title       text
    time        datetime
    host        text
    guest       text
);

CREATE TABLE movies (
    title       text
    year        varchar(4)
    lead_actor  text
);

CREATE TABLE reviews (
    star_rating     integer
    comment         text
);

CREATE TABLE bookmarked (
    title           text
    year            varchar(4)
    username        text
);

CREATE TABLE franchise (
    title           text
    franchise_name  text
);