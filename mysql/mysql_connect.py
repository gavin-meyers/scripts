#!/usr/bin/python

# import MySQL module
import MySQLdb

# connect
db = MySQLdb.connect(host="localhost", user="root", passwd="Pa55word", db="bitnami_piwik", unix_socket="/opt/programs/piwik-1.6-0/mysql/tmp/mysql.sock")

# create a cursor
cursor = db.cursor()

# execute SQL statement
cursor.execute("SELECT * FROM piwik_user")

# get the resultset as a tuple
result = cursor.fetchall()

# iterate through resultset
for record in result:
	print record[0] , "-->", record[1]
