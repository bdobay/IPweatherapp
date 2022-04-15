FROM python:3.6
MAINTAINER Blake Dobay "dobayblake@gmail.com"
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]