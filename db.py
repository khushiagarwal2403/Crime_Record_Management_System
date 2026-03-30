import mysql.connector
import os
from dotenv import load_dotenv
load_dotenv()

def get_connection():
    conn = mysql.connector.connect(
        host=os.getenv('MYSQLHOST', 'hopper.proxy.rlwy.net'),
        port=int(os.getenv('MYSQLPORT', 15308)),
        user=os.getenv('MYSQLUSER', 'root'),
        password=os.getenv('MYSQLPASSWORD', 'OuuDqvoZFqWKlIvVqFaErTdTJPcNQjRo'),
        database=os.getenv('MYSQLDATABASE', 'railway'),
        connection_timeout=30
    )
    return conn