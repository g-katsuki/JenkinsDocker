FROM python:3.8
COPY . /app
WORKDIR /app
RUN ls
RUN python app.py
CMD python app.py

