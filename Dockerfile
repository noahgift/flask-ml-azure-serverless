# Use the official Python image as the base image
FROM python:3.8-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code and the model file into the container
COPY . .

# Expose the port the app will run on
EXPOSE 5000

# Define the command to start the application
CMD ["python", "app.py"]
