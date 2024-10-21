import os
from dotenv import load_dotenv

load_dotenv()

BASE_URL = os.getenv('BASE_URL')
USUARIO = os.getenv('USUARIO')
SENHA = os.getenv('SENHA')