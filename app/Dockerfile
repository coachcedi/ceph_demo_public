# Use an official Python runtime as a parent image
FROM python:3.11

# Set environment variables
ENV AWS_ACCESS_KEY_ID=test
ENV AWS_SECRET_ACCESS_KEY=test

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

RUN pip install Flask boto3 

# Make port 5000 available to the world outside this container
EXPOSE 5000
EXPOSE 8080

# Define environment variable for Flask
ENV FLASK_APP=app.py

# Run app.py when the container launches
CMD ["flask", "run", "--host=0.0.0.0"]
