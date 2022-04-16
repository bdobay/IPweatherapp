from flask import Flask, render_template
from flask import request
import requests
import os

app = Flask(__name__)





@app.route("/")
def home():
    baseUrl = 'http://ip-api.com/json/'
    fullUrl = baseUrl + request.remote_addr
    ipData = (requests.get(fullUrl)).json()
    currentCity = ipData['city']
    return render_template("index.html", value=fullUrl, value2=ipData, value3=currentCity)
    
@app.route("/about")
def about():
    return render_template("about.html")
    
if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5005))
    app.run(debug=True,host='0.0.0.0',port=port)
    

    
