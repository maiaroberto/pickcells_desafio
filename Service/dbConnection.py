import mysql.connector as mysql_connector
from mysql.connector import Error
from dotenv import load_dotenv
import os

load_dotenv()

def create_connection():
    try:
        connection = mysql_connector.connect(
            host="localhost",
            user=os.getenv("MYSQL_USER"),
            password=os.getenv("MYSQL_PASSWORD"),
            database=os.getenv("MYSQL_DATABASE")
        )
        return connection

    except Error as e:
        print("ERRO na CONEXÃO com o banco de dados: ", e)
