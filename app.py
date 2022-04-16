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
    currentLat = str(ipData['lat'])
    currentLon = str(ipData['lon'])
    timeZone = str(ipData['timezone'])
    weatherUrl = 'https://api.open-meteo.com/v1/forecast?latitude='+currentLat+'&longitude='+currentLon+'&daily=temperature_2m_max,temperature_2m_min&timezone='+timeZone
    weatherData = (requests.get(weatherUrl)).json()
    dailyMin = weatherData['daily']['temperature_2m_min'][0]
    return render_template("index.html", value=fullUrl, value2=ipData, 
                           value3=weatherData,value4=dailyMin)
    
@app.route("/about")
def about():
    return render_template("about.html")
    
if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5005))
    app.run(debug=True,host='0.0.0.0',port=port)
    

    
