from flask import Flask

application = Flask(__name__)
application.config['SECRET_KEY'] = 'you-will-never-guess'

from app import routes