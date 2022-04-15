from flask import Flask, render_template
from flask import request
import requests
import os

app = Flask(__name__)

baseUrl = 'http://ip-api.com/json/'
hi = type(request.remote_addr)

@app.route("/")
def home():
    return render_template("index.html", value=hi)
    
@app.route("/about")
def about():
    return render_template("about.html")
    
if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5005))
    app.run(debug=True,host='0.0.0.0',port=port)
    

    
