from flask import Flask, render_template, request, redirect, flash, url_for, send_from_directory
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user, current_user
from werkzeug.security import check_password_hash, generate_password_hash
from datetime import datetime
import pymysql  # need for mysql
pymysql.install_as_MySQLdb()

DB_USERNAME = 'root'
DB_PASSWORD = '******'
DB_NAME = 'elibrary'


app = Flask(__name__)
app.secret_key = 'some secret salt'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://' + DB_USERNAME + ':' + DB_PASSWORD + '@localhost/' + DB_NAME
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)
login_manager = LoginManager(app)


# need to call if DB file/tables is not exist:
# from app import db
# db.create_all()


class Books(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    author = db.Column(db.String(100), nullable=False)
    year = db.Column(db.Integer, nullable=False)
    genre = db.Column(db.String(50), nullable=False)
    country = db.Column(db.String(50), nullable=False)
    mood_id = db.Column(db.Integer, nullable=False)

    def __repr__(self):
        return '<Books %r>' % self.id


class Genres(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        return '<Genre %r>' % self.id


class Authors(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    year = db.Column(db.Integer, nullable=False)
    country = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        return '<Author %r>' % self.id


class Users(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(10), nullable=False)
    email = db.Column(db.String(20), nullable=False, unique=True)
    password = db.Column(db.String(150), nullable=False)

    def __repr__(self):
        return '<User %r>' % self.id


class Comments(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    text = db.Column(db.String(500), nullable=False)
    user_id = db.Column(db.Integer, nullable=False)
    date = db.Column(db.DateTime, default=datetime.utcnow)

    def __repr__(self):
        return '<Comment %r>' % self.id


class Log(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    text = db.Column(db.String(100), nullable=False)
    user_id = db.Column(db.Integer, nullable=False)
    date = db.Column(db.DateTime, default=datetime.now)

    def __repr__(self):
        return '<Log %r>' % self.id


class Countries(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        return '<Country %r>' % self.id


class Mood(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(20), nullable=False)

    def __repr__(self):
        return '<Mood %r>' % self.id


@login_manager.user_loader
def load_user(user_id):
    return Users.query.get(user_id)


@app.route('/')
@app.route('/home')
def index():
    authors = Authors.query.order_by(Authors.name).all()
    genres = Genres.query.order_by(Genres.name).all()
    countries = Countries.query.order_by(Countries.name).all()
    mood = Mood.query.order_by(Mood.name).all()
    return render_template('index.html', Authors=authors, Genres=genres, Countries=countries, Mood=mood)


@app.route('/catalog')   # all available directions
def catalog():
    if len(request.args) == 0:  # GET without args
        books = Books.query.order_by(Books.name).all()
        return render_template('catalog.html', books=books, Mood=Mood)
    else:   # GET with filtering by points
        author = request.args.get('author')
        genre = request.args.get('genre')
        year = request.args.get('year')
        country = request.args.get('country')
        mood = request.args.get('mood')
        books = Books.query.order_by(Books.name).all()
        filtered_books = []
        year = year.split('-')
        for book in books:
            if year[0] != 'All' and (not int(year[0]) <= book.year <= int(year[1])):
                continue
            if (author == 'All' or book.author == author) and (genre == 'All' or book.genre == genre) \
                    and (country == 'All' or book.country == country) and (mood == 'All' or Mood.query.filter_by(id=book.mood_id).first().name == mood):
                filtered_books.append(book)
        return render_template('catalog.html', books=filtered_books, Mood=Mood)


#
# @app.route('/create', methods=['POST', 'GET'])  # create new direction
# @login_required
# def create():
#     if request.method == 'POST':
#         name = request.form['name']
#         university = request.form['university']
#         ed_form = request.form['ed_form']
#         subjects = request.form['subjects']
#         budget = request.form['budget']
#         paid = request.form['paid']
#         print(name, university, ed_form, subjects, budget, paid)
#
#         direction = Direction(name=name, university=university, ed_form=ed_form,
#                               subjects=subjects, budget=budget, paid=paid)
#
#         try:
#             db.session.add(direction)
#             db.session.commit()
#             return render_template('create.html', status="OK")
#         except:
#             return render_template('create.html', status="ERROR")
#     else:
#         return render_template('create.html')
#
#
# @app.route('/directions/<int:id>/delete')   # delete direction
# def delete(id):
#     direction = Direction.query.get_or_404(id)
#     try:
#         db.session.delete(direction)
#         db.session.commit()
#         return redirect('/directions')
#     except:
#         return 'При удалении произошла ошибка'
#
#
@app.route('/login', methods=['POST', 'GET'])   # login on site
def login():
    if current_user.is_authenticated:
        return render_template('profile.html')

    email = request.form.get('loginEmail')
    password = request.form.get('loginPassword')

    if email and password:
        user = Users.query.filter_by(email=email).first()
        if user and check_password_hash(user.password, password):
            login_user(user)

            # logging
            log = Log(text='Log in', user_id=current_user.id)
            db.session.add(log)
            db.session.commit()

            next_page = request.args.get('next')
            if next_page:
                return redirect(next_page)
            return redirect('/login')
        else:
            flash('Неверный логин или пароль!')
    else:
        flash('Нужно ввести логин и пароль!')
    return render_template('login.html')


@app.route('/logout', methods=['GET', 'POST'])   # logout on site
@login_required
def logout():
    # logging
    log = Log(text='Log out', user_id=current_user.id)
    db.session.add(log)
    db.session.commit()
    logout_user()
    return redirect('/login')


@app.route('/register', methods=['POST'])   # register new user on site
def register():
    name = request.form['registerUsername']
    email = request.form['registerEmail']
    password = request.form['registerPassword']
    repeat_password = request.form['registerRepeatPassword']
    print(name, email, password, repeat_password)
    if not (name or email or password or repeat_password):
        flash('Не все поля заполнены')
        return redirect('/login')
        # return render_template('login.html')
    elif password != repeat_password:  # validation
        flash('Пароли не совпадают')
        return redirect('/login')
        # return render_template('login.html')
    else:
        user = Users.query.filter_by(email=email).first()
        if user:
            flash('Пользователь с таким адресом электронной почты уже есть')
            return redirect('/login')
            # return render_template('login.html')
        hash = generate_password_hash(password)
        new_user = Users(name=name, email=email, password=hash)
        db.session.add(new_user)
        db.session.commit()
        login_user(new_user)

        return redirect('/login')


@app.after_request
def redirect_to_login(response):
    if response.status_code == 401:
        return redirect('/login' + '?next=' + request.url)
    return response
#
#
# @app.route('/universities')
# def universities():
#     universities_lst = University.query.order_by(University.name).all()
#     return render_template('universities.html', universities=universities_lst)


@app.route('/forum', methods=['GET', 'POST'])
@login_required
def forum():
    if request.method == 'POST':
        text = request.form['text']
        comment = Comments(text=text, user_id=current_user.id)

        try:
            db.session.add(comment)
            db.session.commit()
        except:
            flash('Error')

    comments = Comments.query.order_by(Comments.date.desc()).all()
    return render_template('forum.html', comments=comments, User=Users)  # User for defying authors of comments


@app.route('/events')
def events():
    logs = Log.query.order_by(Log.date.desc()).all()
    return render_template('events.html', logs=logs, User=Users)  # User for defying authors of comments


if __name__ == '__main__':
    app.run(debug=True)
