import sqlite3 #importa biblioteca

connection = sqlite3.connect('database.db')

with open('schema.sql') as r:
    connection.executescript(r.read())

cur = connection.cursor()

cur.execute("")

connection.commit()
connection.close()