from flask import render_template
from app import application

@application.route ('/')
@application.route ('/index')
def index():
    return render_template('base.html')