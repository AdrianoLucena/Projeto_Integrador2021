from flask import Flask, render_template, request, url_for, flash, redirect
import os, datetime
import sqlite3
import mysql.connector
from flask_sqlalchemy import SQLAlchemy
from werkzeug.exceptions import abort
from datetime import date


project_dir = os.path.dirname(os.path.abspath(__file__))
database_file = "sqlite:///{}".format(os.path.join(project_dir, "database.db"))

app = Flask('__name__')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SECRET_KEY'] = 'your secret key'
app.config['SQLALCHEMY_DATABASE_URI'] = database_file
db = SQLAlchemy(app)

class tb_chamados(db.Model):
    id_chamado = db.Column(db.Integer, primary_key=True)
    dt_criacao = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    descricao = db.Column(db.String(200), nullable=False)
    nome = db.Column(db.String(200), nullable=False)
    email = db.Column(db.String(200), nullable=False)
    servico = db.Column(db.String(200), nullable=False)


@app.route('/')
def index():
    posts = tb_chamados.query.all()
    return render_template('index.html', posts=posts)


def get_post(id_chamado):
    post = tb_chamados.query.filter_by(id_chamado=id_chamado).first()
    if post is None:
        abort(484)
    return post

## comentárop

@app.route('/<int:id_chamado>')
def post(id_chamado):
    post = get_post(id_chamado)
    return render_template('post.html', post=post)
'''
@app.route('/cadastro', methods=('GET', 'POST'))
def create():
    return render_template('cadastro.html')
'''

@app.route('/cadastro', methods=('GET', 'POST'))
def create():
    if request.method == 'POST':
        nome = request.form['nome']
        descricao = request.form['descricao']
        email = request.form['email']
        servico = request.form['email']

        if not nome:
            flash('O Nome é obrigatório')
        else:
            post = tb_chamados(nome=nome, descricao=descricao,dt_criacao=datetime.datetime.now(),email=email,servico=servico)
            db.session.add(post)
            db.session.commit()
            return redirect(url_for('index'))

    return render_template('cadastro.html')


@app.route('/<int:id_chamado>/edit', methods=('GET', 'POST'))
def edit(id_chamado):
    post = get_post(id_chamado)

    if request.method == 'POST':
        nome = request.form['nome']
        descricao = request.form['descricao']
        email = request.form['email']
        servico = request.form['servico']

        if not nome:
            flash('O Nome é obrigatório')
        else:
            post.nome = nome
            post.descricao = descricao
            post.email = email
            post.servico = servico
            post.dt_criacao = datetime.datetime.now()
            db.session.commit()
            return redirect(url_for('index'))

    return render_template('edit.html', id_chamado=id_chamado)


