#!/usr/bin/env/python

import sqlite3
import sys

class pythonSQLite:
	DB_FILE_NAME = "songs.sqlite3.db"
	def __init__(self, usrInput):
		self.usrInput = usrInput
	
	#0,1,2,3,4
	searchList = [None, None, 'genres', 'artists', 'albums', 'songs'];
	
	#Establish connection to database
	db_connection = sqlite3.connect(DB_FILE_NAME)
	
	#Creates a cursor -- pointer to where you are in a collection of data
	cursor = db_connection.cursor()

	#Displays data from SQLite table
	@staticmethod
	def SQLiteDisplay(SQLinput):
		#Displays entire table
		if SQLinput == 1:
			genreList = [(None, None)]
			artistList = [(None, None)]
			albumList = [(None, None)]
			#Store tuples into lists for access by songs
			for genres in pythonSQLite.cursor.execute("SELECT * FROM genres"): genreList.append(genres)
			for artists in pythonSQLite.cursor.execute("SELECT * FROM artists"): artistList.append(artists)
			for albums in pythonSQLite.cursor.execute("SELECT * FROM albums"): albumList.append(albums)
			#Output table
			print("Song:           Genre:           Artist:           Album:")
			for row in pythonSQLite.cursor.execute("SELECT * FROM songs"):
				#row [0=id,1=name,2=genre_id,3=album_id,4=artist_id]
				print(row[1], end="".ljust(16-len(row[1]))),
				print("".join(t[1].ljust(21 - len(t[1])) for t in genreList if t[0] == row[2]), end=""),#genre
				print("".join(a[1].ljust(30 - len(a[1])) for a in artistList if a[0] == row[4]), end=""),#artist
				print("".join(m[1] for m in albumList if m[0] == row[3]))#album
		#Displays either artist, genre, or album 17
		elif SQLinput >= 2 or SQLinput <= 4:
			print(pythonSQLite.searchList[SQLinput] + " in the database:")
			for row in pythonSQLite.cursor.execute("SELECT * FROM " + (pythonSQLite.searchList[SQLinput])): print(str(row[0]) + ". " + row[1])

	#Obtains max id from table -- used by SQLiteInsert to add song/artist/album to end of database
	@staticmethod
	def SQLiteMaxID(SQLinput):
		pythonSQLite.cursor.execute("SELECT * FROM " + pythonSQLite.searchList[SQLinput]\
		 + " ORDER BY id DESC LIMIT 1;");
		max_id = pythonSQLite.cursor.fetchone()[0]
		return max_id + 1 #add 1 to prevent collision of ID insertion

	#INSERTs queries into database for SQLite
	@staticmethod
	def SQLiteInsert(SQLinput, SQL_ADD):
		#Handles and stores new genres and artists input 
		if SQLinput == 2 or SQLinput == 3:
			pythonSQLite.cursor.execute("INSERT INTO " + pythonSQLite.searchList[SQLinput] + " (id, name) VALUES (?, ?)"\
				, (pythonSQLite.SQLiteMaxID(SQLinput), (SQL_ADD)) )
			print("Successfully added!")
		# Handles and stores new albums input
		elif SQLinput == 4:
			pythonSQLite.SQLiteDisplay(3)
			__artistInput = input("Select an Artist number to match your album: ")
			pythonSQLite.cursor.execute("INSERT INTO albums (id, name, artist_id) VALUES (?, ?, ?)"\
				, (pythonSQLite.SQLiteMaxID(SQLinput), (SQL_ADD), __artistInput) )
			print("Successfully added!")
		#Handles and stores full song/album/artist input
		elif SQLinput == 5:
			pythonSQLite.SQLiteDisplay(2)
			__genreInput = input("Associate a Genre to your song: ")
			pythonSQLite.SQLiteDisplay(4)
			__albumInput = input("Associate an Album to your song: ")
			pythonSQLite.SQLiteDisplay(3)
			__artistInput = input("Associate an Artist to your song: ")
			pythonSQLite.cursor.execute("INSERT INTO songs (id, name, genre_id, album_id, artist_id) VALUES (?, ?, ?, ?, ?)"\
				, (pythonSQLite.SQLiteMaxID(SQLinput), (SQL_ADD), __genreInput, __albumInput, __artistInput) )
			print("Successfully added!")
		#Catches exceptions
		else:
			print("You shouldn't be here..")

	#Intakes user input to add songs to SQLite table
	def query(self):
		if self.usrInput == '1':
			self.SQLiteDisplay(1)
			pythonSQLite.db_connection.close()
			sys.exit()
		#User input to add new genre
		elif self.usrInput == '2': 
			self.SQLiteDisplay(2)
			self.SQLiteInsert(2, input("Add new genre: "))
		#User input to add new artist
		elif self.usrInput == '3': 
			self.SQLiteDisplay(3)
			self.SQLiteInsert(3, input("Add new artist: "))
		#User input to add new album -- Selects artist to associate with
		elif self.usrInput == '4': 
			self.SQLiteDisplay(4)
			self.SQLiteInsert(4, input("Add new album: "))
		#User input to add new song -- Selects genre, artist, and album to associate with
		elif self.usrInput == '5':
			print("Add a new Song!")
			self.SQLiteInsert(5, input("Song Name: "))
			#user gets to select each genre, artist, and album from existing list
		#Error handle invalid number
		else:
			print("Invalid input")
		pythonSQLite.db_connection.commit()

#This is vulnerable to SQL injection attack
while 1:
	text = input(
	"""Welcome to the music database!
	1. Display all song information
	2. Add a new genre
	3. Add a new artist
	4. Add a new album
	5. Add a new song
	Enter a choice:
	""")
	sqlInput = pythonSQLite(text)
	sqlInput.query()