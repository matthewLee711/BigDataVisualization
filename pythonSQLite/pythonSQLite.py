#!/usr/bin/env/python

import sqlite3

class pythonSQLite:
	DB_FILE_NAME = "songs.sqlite3.db"
	def __init__(self, usrInput):
		self.usrInput = usrInput

	#SQLite queries
	SQL_SELECT_SONGS = "SELECT name FROM songs"
	SQL_INSERT_SONG = "INSERT INTO song (id, name, genre_id, album_id) VALUES "
	
	#0,1,2,3,4
	searchList = [None, None, 'genres', 'artists', 'albums'];
	#debug statement
	#pythonSQLite.cursor.execute("INSERT INTO genres (id, name) VALUES (11, 'Matthew')")

	#toDO
	#1. add sqlite iterators for seemless experience -- song, genre, artist
	#2. join song with genres_id, and artists_id
	db_connection = sqlite3.connect(DB_FILE_NAME)
	
	#Create a cursor -- pointer to where you are in a collection of data
	cursor = db_connection.cursor()

	#Obtains max id from table -- to be used by SQLiteInsert
	@staticmethod
	def SQLiteMaxID(SQLinput):
		pythonSQLite.cursor.execute("SELECT * FROM " + pythonSQLite.searchList[SQLinput]\
		 + " ORDER BY id DESC LIMIT 1;");
		max_id = pythonSQLite.cursor.fetchone()[0]
		return max_id + 1 #add 1 to prevent collision of ID insertion

	#INSERT query for SQLite
	@staticmethod
	def SQLiteInsert(SQLinput, SQL_ADD):
		print(SQL_ADD)
		#Handles and stores new genres and artists input 
		if SQLinput == 2 or SQLinput == 3:
			# pythonSQLite.cursor.execute("INSERT INTO " + pythonSQLite.searchList[SQLinput] + " (id, name) "\
			#  + "VALUES " + "(" + pythonSQLite.SQLiteMaxID(SQLinput) + ", " + SQL_ADD + ")")
			# pythonSQLite.cursor.execute("INSERT INTO " + pythonSQLite.searchList[SQLinput] + " (id, name) "\
			#  + "VALUES (?, ?)", pythonSQLite.SQLiteMaxID(SQLinput), SQL_ADD)
			pythonSQLite.cursor.execute("INSERT INTO artists (id, name) VALUES (?, ?)"\
				, (pythonSQLite.SQLiteMaxID(SQLinput), (SQL_ADD)) )
		# Handles and stores new albums input
		elif SQLinput == 4:
			pythonSQLite.cursor.execute("INSERT INTO" + pythonSQLite.searchList[SQLinput]\
			 + " (id, name) " + "VALUES " + '(' + pythonSQLite.SQLiteMaxID(SQLinput) + ', ' + SQL_ADD + ')')
		#Catches exceptions
		else:
			print("You shouldn't be here..")

	#Intakes user input to add songs to SQLite table
	def query(self):
		if self.usrInput == '1':
			for row in pythonSQLite.cursor.execute(pythonSQLite.SQL_SELECT_SONGS):
				print(row)
			#Program needs to quit after this
		#User input to add new genre
		elif self.usrInput == '2': self.SQLiteInsert(2, input("Add new genre: "))
		#User input to add new artist
		elif self.usrInput == '3': self.SQLiteInsert(3, input("Add new artist: "))
		#User input to add new album
		elif self.usrInput == '4': self.SQLiteInsert(4, input("Add new album: "))
		#User input to add new song
		elif self.usrInput == '5':
			SQL_ADD = input("Add new song: ")
			#self.SQLiteInsert(5, SQL_ADD)
			#user gets to select each genre, artist, and album from existing list
		else:
			print("Invalid input")
		#pythonSQLite.db_connection.commit()
		#pythonSQLite.db_connection.close()

#This is vulnerable to SQL injection attack
while 1:
	text = input(
	"""Welcome to the music database!
	1. Display all song information
	2. Add a new genre
	3. Add a new artist
	4. Add a new song
	Enter a choice:
	""")
	sqlInput = pythonSQLite(text)
	sqlInput.query()