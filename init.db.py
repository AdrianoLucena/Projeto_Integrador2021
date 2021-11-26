import sqlite3 #importa biblioteca
##import mysql.connector

connection = sqlite3.connect('database.db')

with open('schema.sql') as f:
    connection.executescript(f.read())

cur = connection.cursor()

##cur.execute("INSERT INTO tb_chamados (id_chamado, nome, descricao) VALUES (?,?,?)",
##            ('1','Nome pessoa', 'teste01')
##            )

##cur.execute("INSERT INTO tb_chamados (id_chamado, nome, descricao) VALUES (?,?,?)",
##            ('2','Pessoa 2', 'teste01')
##            )

connection.commit()
connection.close()