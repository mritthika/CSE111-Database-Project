import sqlite3
from sqlite3 import Error
#import os
#import random

def openConnection(_dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Open database: ", _dbFile)

    conn = None
    try:
        conn = sqlite3.connect(_dbFile)
        print("open connection success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")

    #return connection object

    return conn

    #closing connection

def closeConnection(_conn, _dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Close database: ", _dbFile)

    try:
        _conn.close()
        print("close database success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")

def searchMovieMenu(_conn):
    print("+++++ Searching Menu +++++")

    database = r'marvel.sqlite'

    conn = openConnection(database)

    print("THIS IS THE SEARCH MENU! ENTER THE NUMBER ASSOCIATED WITH HOW YOU WOULD LIKE TO SEARCH FOR A MOVIE BELOW:")

    print("1 -- Search by Movie Title")
    print("2 -- Search by Release Year")
    print("3 -- Search by Franchise")
    print("4 -- Search by Actor Name")
    print("5 -- Search by Genre")

    option = int(input("Options: "))
    with conn:
        if option == 0:
            searchMovieMenu(conn)
        if option == 1:
            searchMovieTitle(conn)
        if option == 2:
            searchMovieReleaseYear(conn)
        if option == 3:
            searchMovieFranchiseName(conn)
        if option == 4:
            searchMovieActor(conn)
        if option == 5:
            searchMovieGenre(conn)

        #closeConnection(conn, database)

def searchMovieTitle(_conn):
    print("++++++++++++++++++++++++++++++++++")

    try:
        movie = input("SEARCH FOR A MOVIE BY THE TITLE: ")
        sql = """select movie_title, release_year, lead_actor, supporting_actor, side_actor, franchise
                from movies
                where movie_title like ?"""
        cur = _conn.cursor()
        cur.execute(sql, (movie + '%',))
        rows = cur.fetchall()

        if len(rows) == 0:
            print("There are no movies that satisfy that criteria in this database.")
            main()
        else: 
            l = ("Movie Title | Release Year | Lead Actor | Supporting Actor | Side Actor | Franchise")
            print(l)
            for row in rows:
                print(' | '.join([str(r) for r in row]))
#                print("Success!")
    except Error as e:
        print(e)

def searchMovieReleaseYear(_conn):
    print("++++++++++++++++++++++++++++++++++")

    try:
        movie = input("SEARCH FOR A MOVIE BY THE MOVIE RELEASE YEAR: ")
        sql = """select movie_title, lead_actor, supporting_actor, side_actor, franchise
                from movies
                where release_year like ?"""
        cur = _conn.cursor()
        cur.execute(sql, (movie + '%',))
        rows = cur.fetchall()

        if len(rows) == 0:
            print("There are no movies that satisfy that criteria in this database.")
            main()
        else: 
            l = ("Movie Title | Lead Actor | Supporting Actor | Side Actor | Franchise")
            print(l)
            for row in rows:
                print(' | '.join([str(r) for r in row]))
#                print("Success!")
    except Error as e:
        print(e)

def searchMovieFranchiseName(_conn):
    print("++++++++++++++++++++++++++++++++++")

    try:
        movie = input("SEARCH FOR A MOVIE BY THE MOVIE FRANCHISE: ")
        sql = """select movie_title, release_year, lead_actor, supporting_actor, side_actor
                from movies
                where franchise like ?"""
        cur = _conn.cursor()
        cur.execute(sql, (movie + '%',))
        rows = cur.fetchall()

        if len(rows) == 0:
            print("There are no movies that satisfy that criteria in this database.")
            main()
        else: 
            l = ("Movie Title | Release Year | Lead Actor | Supporting Actor | Side Actor")
            print(l)
            for row in rows:
                print(' | '.join([str(r) for r in row]))
#                print("Success!")
    except Error as e:
        print(e)


def searchMovieActor(_conn):
    print("++++++++++++++++++++++++++++++++++")

    try:
        movie = input("SEARCH FOR A MOVIE BY AN ACTOR: ")
        sql = """select movies.movie_title, movies.release_year, movies.lead_actor, movies.supporting_actor, movies.side_actor, movies.franchise
                from movies, actors, actors_movies
                where movies.movie_title = actors_movies.movie_title
                and actors.actor_name = actors_movies.actors_name
                and actors.actor_name like ?"""

        cur = _conn.cursor()
        cur.execute(sql, (movie + '%',))
        rows = cur.fetchall()

        if len(rows) == 0:
            print("There are no movies that satisfy that criteria in this database.")
            main()
        else: 
            l = ("Movie Title | Release Year | Lead Actor | Supporting Actor | Side Actor | Franchise")
            print(l)
            for row in rows:
                print(' | '.join([str(r) for r in row]))
#                print("Success!")
    except Error as e:
        print(e)

def searchMovieGenre(_conn):
    print("++++++++++++++++++++++++++++++++++")

    try:
        movie = input("SEARCH FOR A MOVIE BY A GENRE: ")
        sql = """select movies.movie_title, movies.release_year, movies.lead_actor, movies.supporting_actor, movies.side_actor, movies.franchise
                from movies, genre, genre_movies
                where movies.movie_title = genre_movies.movie_title
                and genre.genre = genre_movies.genre
                and genre.genre like ?"""
        cur = _conn.cursor()
        cur.execute(sql, (movie + '%',))
        rows = cur.fetchall()

        if len(rows) == 0:
            print("There are no movies that satisfy that criteria in this database.")
            main()
        else: 
            l = ("Movie Title | Release Year | Lead Actor | Supporting Actor | Side Actor | Franchise")
            print(l)
            for row in rows:
                print(' | '.join([str(r) for r in row]))
#                print("Success!")
    except Error as e:
        print(e)

def searchActorMenu(_conn):
    print("+++++ Searching Menu +++++")

    database = r'marvel.sqlite'

    conn = openConnection(database)

    print("This is the search menu! Enter the number associated with how you would like to search for an actor below:")

    print("1 -- Search by Movie Title")
    print("2 -- Search by Franchise")

    option = int(input("Options: "))
    with conn:
        if option == 0:
            searchActorMenu(conn)
        if option == 1:
           searchActorMovieTitle(conn)
        if option == 2:
            searchActorFranchiseName(conn)

        #closeConnection(conn, database)

def searchActorMovieTitle(_conn):
    print("++++++++++++++++++++++++++++++++++")

    try:
        actor = input("SEARCH FOR AN ACTOR BY A MOVIE TITLE: ")
        sql = """select actors_movies.actors_name, actors_movies.movie_title
                from movies, actors, actors_movies
                where movies.movie_title = actors_movies.movie_title
                and actors.actor_name = actors_movies.actors_name
                and movies.movie_title like ?"""
        cur = _conn.cursor()
        cur.execute(sql, (actor + '%',))
        rows = cur.fetchall()

        if len(rows) == 0:
            print("There are no actors that satisfy that criteria in this database.")
            main()
        else: 
            l = ("Actor Name | Movie Title")
            print(l)
            for row in rows:
                print(' | '.join([str(r) for r in row]))
#                print("Success!")
    except Error as e:
        print(e)

def searchActorFranchiseName(_conn):
    print("++++++++++++++++++++++++++++++++++")

    try:
        actor = input("SEARCH FOR AN ACTOR BY A FRANCHISE: ")
        sql = """select franchise_actor.actor_name, franchise_actor.franchise
                from actors, franchise, franchise_actor
                where actors.actor_name = franchise_actor.actor_name
                and franchise.franchise_name = franchise_actor.franchise
                and franchise.franchise_name like ?"""

        cur = _conn.cursor()
        cur.execute(sql, (actor + '%',))
        rows = cur.fetchall()

        if len(rows) == 0:
            print("There are no actors that satisfy that criteria in this database.")
            main()
        else: 
            l = ("Actor Name | Franchise")
            print(l)
            for row in rows:
                print(' | '.join([str(r) for r in row]))
#                print("Success!")
    except Error as e:
        print(e)

def printBookmarks(_conn):
    print("++++++++++++++ BOOKMARKED MOVIES ++++++++++++++++++++")

    try:
        sql = """select * from bookmarked"""

        cur = _conn.cursor()
        cur.execute(sql)
        rows = cur.fetchall()

        for row in rows:
            print(' | '.join([str(r) for r in row]))

    except Error as e:
        print(e)

def bookmarkMenu(_conn):
    print("+++++ Bookmarking Menu +++++")

    database = r'marvel.sqlite'

    conn = openConnection(database)

    print("Enter the number associated with how you would like to bookmark a movie from the list below:")

    print("1 -- Bookmark by Movie Title")
    print("2 -- Bookmark by Franchise")
    print("3 -- Bookmark by Actor Name")
    print("4 -- Bookmark by Release Year")

    option = int(input("Options: "))
    with conn:
        if option == 0:
            bookmarkMenu(conn)
        if option == 1:
           BookmarkByTitle(conn)
           printBookmarks(conn)
        if option == 2:
            BookmarkByFranchise(conn)
            printBookmarks(conn)
        if option == 3:
            BookmarkByActor(conn)
            printBookmarks(conn)
        if option == 4:
            BookmarkByYear(conn)
            printBookmarks(conn)

        #closeConnection(conn, database)

def BookmarkByYear(_conn):
    print("++++++++++++++++++++++++++++++++++")

    try:
        bookmark = input("BOOKMARK A MOVIE BY ITS RELEASE YEAR: ")

        sql = """insert into bookmarked (movie_title, lead_actor, franchise, release_year)
                select movie_title, lead_actor, franchise, release_year
                from movies
                where movies.release_year like ?
                and movies.movie_title not like movies.movie_title"""

        #args = [bookmark]

        cur = _conn.cursor()
        cur.execute(sql, (bookmark + '%',))
        rows = cur.fetchall()

        for row in rows:
            print(' | '.join([str(r) for r in row]))
        
    except Error as e:
        print(e)

def BookmarkByActor(_conn):
    print("++++++++++++++++++++++++++++++++++")

    try:
        bookmark = input("BOOKMARK A MOVIE BY THE LEAD ACTORS NAME: ")

        sql = """insert into bookmarked (movie_title, lead_actor, franchise, release_year)
                select movie_title, lead_actor, franchise, release_year
                from movies
                where movies.lead_actor like ?"""

        #args = [bookmark]

        cur = _conn.cursor()
        cur.execute(sql, (bookmark + '%',))
        rows = cur.fetchall()

        for row in rows:
            print(' | '.join([str(r) for r in row]))
        
    except Error as e:
        print(e)

def BookmarkByFranchise(_conn):
    print("++++++++++++++++++++++++++++++++++")

    try:
        bookmark = input("BOOKMARK A MOVIE BY ITS FRANCHISE: ")

        sql = """insert into bookmarked (movie_title, lead_actor, franchise, release_year)
                select movie_title, lead_actor, franchise, release_year
                from movies
                where movies.franchise like ?"""

        #args = [bookmark]

        cur = _conn.cursor()
        cur.execute(sql, (bookmark + '%',))
        rows = cur.fetchall()

        for row in rows:
            print(' | '.join([str(r) for r in row]))
     
    except Error as e:
        print(e)

def BookmarkByTitle(_conn):
    print("++++++++++++++++++++++++++++++++++")

    try:
        bookmark = input("BOOKMARK A MOVIE BY ITS TITLE: ")

        sql = """insert into bookmarked (movie_title, lead_actor, franchise, release_year)
                select movie_title, lead_actor, franchise, release_year
                from movies
                where movies.movie_title like ?"""

        #args = [bookmark]

        cur = _conn.cursor()
        cur.execute(sql, (bookmark + '%',))
        rows = cur.fetchall()

        for row in rows:
            print(' | '.join([str(r) for r in row]))

    except Error as e:
        print(e)

def DeleteBookmark(_conn):
    print("++++++++++++++++++++++++++++++++++")

    try:
        bookmark = input("DELETE A BOOKMARKED MOVIE BY ITS TITLE: ")

        sql = """delete from bookmarked where movie_title like ?"""

        #args = [bookmark]

        cur = _conn.cursor()
        cur.execute(sql, (bookmark + '%',))
        rows = cur.fetchall()

        for row in rows:
            print(' | '.join([str(r) for r in row]))
        
    except Error as e:
        print(e)

def printMovies(_conn):
    print("++++++++++++++ ALL MARVEL MOVIES ++++++++++++++++++++")

    try:
        sql = """select * from movies"""

        cur = _conn.cursor()
        cur.execute(sql)
        rows = cur.fetchall()

        for row in rows:
            print(' | '.join([str(r) for r in row]))

    except Error as e:
        print(e)

def countMenu(_conn):
    print("+++++ Count Menu +++++")

    database = r'marvel.sqlite'

    conn = openConnection(database)

    print("Enter the number associated with how you would like to view the Marvel Database Inventory Count:")

    print("1 -- Number of Movies in a Particular Franchise")
    print("2 -- Number of Movies Within a Particular Genre")
    print("3 -- Number of Marvel Movies a Particular Actor has Acted In")

    option = int(input("Options: "))
    with conn:
        if option == 0:
            countMenu(conn)
        if option == 1:
            countMoviesFranchise(conn)
        if option == 2:
            countMoviesGenres(conn)
        if option == 3:
            countActorsMovies(conn)

        #closeConnection(conn, database)

def countMoviesFranchise(_conn):
    print("++++++++++++++++++++++++++++++++++")

    try:
        bookmark = input("COUNT HOW MANY MOVIES ARE IN A CERTAIN FRANCHISE: ")

        sql = """select count(*)
                from movies, franchise
                where franchise.franchise_name = movies.franchise
                and franchise.franchise_name like ?"""

        #args = [bookmark]

        cur = _conn.cursor()
        cur.execute(sql, (bookmark + '%',))
        rows = cur.fetchall()

        for row in rows:
            print(' | '.join([str(r) for r in row]))

    except Error as e:
        print(e)

def countMoviesGenres(_conn):
    print("++++++++++++++++++++++++++++++++++")

    try:
        bookmark = input("COUNT HOW MANY GENRES A MOVIE HAS BY THE MOVIE TITLE: ")

        sql = """select count(*)
                from movies, genre, genre_movies
                where movies.movie_title = genre_movies.movie_title
                and genre.genre = genre_movies.genre
                and movies.movie_title like ?"""

        #args = [bookmark]

        cur = _conn.cursor()
        cur.execute(sql, (bookmark + '%',))
        rows = cur.fetchall()

        for row in rows:
            print(' | '.join([str(r) for r in row]))

    except Error as e:
        print(e)

def countActorsMovies(_conn):
    print("++++++++++++++++++++++++++++++++++")

    try:
        bookmark = input("COUNT HOW MANY MOVIES AN ACTOR HAS BEEN IN BY THE ACTOR NAME: ")

        sql = """select count(*)
                from movies, actors, actors_movies
                where movies.movie_title = actors_movies.movie_title
                and actors.actor_name = actors_movies.actors_name
                and actors.actor_name like ?"""

        #args = [bookmark]

        cur = _conn.cursor()
        cur.execute(sql, (bookmark + '%',))
        rows = cur.fetchall()

        for row in rows:
            print(' | '.join([str(r) for r in row]))

    except Error as e:
        print(e)

def printFranchises(_conn):
    print("++++++++++++++ ALL MARVEL FRANCHISES ++++++++++++++++++++")

    try:
        sql = """select * from franchise"""

        cur = _conn.cursor()
        cur.execute(sql)
        rows = cur.fetchall()

        for row in rows:
            print(' | '.join([str(r) for r in row]))

    except Error as e:
        print(e)

def printActors(_conn):
    print("++++++++++++++ ALL MARVEL ACTORS ++++++++++++++++++++")

    try:
        sql = """select * from actors"""

        cur = _conn.cursor()
        cur.execute(sql)
        rows = cur.fetchall()

        for row in rows:
            print(' | '.join([str(r) for r in row]))

    except Error as e:
        print(e)

def ViewMovieReviews(_conn):
    print("++++++++++++++ ALL MOVIE REVIEWS ++++++++++++++++++++")

    try:
        sql = """select * from reviews"""

        cur = _conn.cursor()
        cur.execute(sql)
        rows = cur.fetchall()

        for row in rows:
            print(' | '.join([str(r) for r in row]))

    except Error as e:
        print(e)

def WriteMovieReview(_conn):
    print("++++++++++++++ WRITE A MOVIE REVIEW ++++++++++++++++++++")
#    print("WRITE THE TITLE OF THE MOVIE, GIVE IT A RATING OUT OF FIVE, WRITE A COMMENT:")

    try:
        reviewmovietitle = input("WRITE THE TITLE OF THE MOVIE: ")
        reviewstarrating = input("RATE THE MOVIE OUT OF FIVE: ")
        reviewcomment = input("WRITE A COMMENT: ")

        sql = """insert into reviews (movie_title, star_rating, comment) values (?, ?, ?)"""

        #args = [review]
        args = [reviewmovietitle, reviewstarrating, reviewcomment]

        cur = _conn.execute(sql, args)
        rows = cur.fetchall()
        
        for row in rows:
            print(' | '.join([str(r) for r in row]))
            

    except Error as e:
        print(e)

def addMovies(_conn):
    print("++++++++++++++ WRITE A MOVIE REVIEW ++++++++++++++++++++")
#    print("WRITE THE TITLE OF THE MOVIE, GIVE IT A RATING OUT OF FIVE, WRITE A COMMENT:")

    try:
        movietitle = input("WHAT IS THE TITLE OF THE MOVIE: ")
        releaseyear = input("WHAT YEAR WAS THIS MOVIE RELEASED: ")
        leadactor = input("WHO IS THE LEAD ACTOR: ")
        supportingactor = input("WHO IS THE SUPPORTING ACTOR: ")
        sideactor = input("WHO IS THE SIDE ACTOR: ")
        franchise = input("WHAT FRANCHISE DOES THIS MOVIE BELONG TO: ")


        sql = """insert into movies (movie_title, release_year, lead_actor, supporting_actor, side_actor, franchise) values (?, ?, ?, ?, ?, ?)"""

        #args = [review]
        args = [movietitle, releaseyear, leadactor, supportingactor, sideactor, franchise]

        cur = _conn.execute(sql, args)
        rows = cur.fetchall()
        
        for row in rows:
            print(' | '.join([str(r) for r in row]))
            

    except Error as e:
        print(e)

def main():
    database = r'marvel.sqlite'

    #create a database connection
    conn = openConnection(database)

    print("--- Marvel Movie Searcher --- \n")

    print("Enter the number associated with what you would like to do: ")
    print("01 -- Search for Movies")
    print("02 -- View All Marvel Movies")
    print("03 -- Add a Movie")
    print("04 -- View Bookmarked Movies")
    print("05 -- Add Bookmarked Movies")
    print("06 -- Delete a Bookmarked Movie")
    print("07 -- View Franchises")
    print("08 -- Search for Actors")
    print("09 -- Count Movies that Follow Certain Conditions")
    print("10 -- View Marvel Actors")
    print("11 -- View Movie Reviews")
    print("12 -- Review a Movie Review")

    option = int(input('Options: '))
    with conn:
        if option == 0:
            main()
        if option == 1:
            searchMovieMenu(conn)
        if option == 2:
            printMovies(conn)
        if option == 3:
            addMovies(conn)
            printMovies(conn)
        if option == 4:
            printBookmarks(conn)
        if option == 5:
            bookmarkMenu(conn)
        if option == 6:
            DeleteBookmark(conn)
            printBookmarks(conn)
        if option == 7:
           printFranchises(conn)
        if option == 8:
            searchActorMenu(conn)
        if option == 9:
            countMenu(conn)
        if option == 10:
            printActors(conn)
        if option == 11:
            ViewMovieReviews(conn)
        if option == 12:
            WriteMovieReview(conn)
            ViewMovieReviews(conn)
        

    closeConnection(conn, database)

if __name__ == '__main__':
    main()