import mysql.connector
import os
from dotenv import load_dotenv
load_dotenv()

def get_connection():
    conn = mysql.connector.connect(
        host=os.getenv('MYSQLHOST', 'mysql.railway.internal'),
        port=int(os.getenv('MYSQLPORT', 3306)),
        user=os.getenv('MYSQLUSER', 'root'),
        password=os.getenv('MYSQLPASSWORD', 'MbZigxtxrUeYarCWbQERDcNLbBujZxuP'),
        database=os.getenv('MYSQLDATABASE', 'railway')
    )
    return conn