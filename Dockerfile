FROM python:3.8
COPY . /app
WORKDIR /app
RUN ls
CMD python app.py

