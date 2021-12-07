from flask import Flask, redirect, url_for, render_template, request, session
from datetime import timedelta

import sqlite3
from sqlite3 import Error

conn = sqlite3.connect('marvel.sqlite', check_same_thread = False)

app = Flask(__name__)
app.secret_key = "marvel"
app.permanent_session_lifetime = timedelta(minutes=2)

#initial log in page
@app.route("/", methods=["POST", "GET"])
def login():
    if request.method == "POST":
        session.permanent = True
        user = request.form["nm"]
        session["user"]= user    
        return redirect(url_for("movies"))
    else:
        if "user" in session:
            return redirect(url_for("movies"))

        return render_template("login.html")

@app.route("/movies")
def movies():

    if request.method == "searchmovie":
        session.permanent = True
        user = request.form["movie"]
        session["user"] = user

        #entire_movie_table = """select * from movies;"""
    
        #cursor = conn.execute(entire_movie_table)
        #items = cursor.fetchall()

    #button to search the list of movies by the lead actors name
        #the returned list will return all of the movies that actor was listed to be in

    return render_template("movies.html")

@app.route("/actors")
def actors():
    return redirect(url_for(""))

#the user page that saves the information entered during the log in
@app.route("/user")
def user():
    if "user" in session:
        user = session["user"]
        return f"<h1>{user}</h1>"
    else:
        return redirect(url_for("login"))

@app.route("/logout")
def logout():
    session.pop("user", None)
    return redirect(url_for("login"))

if __name__ == "__main__":
    app.run(debug=True)


#@app.route("/<name>")
#def user(name):
#    return f"Hello {name}!"

#restricted page that gets redirected
#@app.route("/admin")
#def admin():
#    return redirect(url_for("user", name="Admin!"))