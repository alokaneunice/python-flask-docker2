# Use the official Python image
FROM python:3.9-slim
ADD . /app
# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt
COPY . .
# Make port 5006 available to the world outside this container
EXPOSE 5006
HEALTHCHECK --interval=30s --timeout=30s --start-period=30s --retries=5 \
     CMD curl -f http://localhost:5006/health || exit 1
# Run app.py when the container launches
ENTRYPOINT  ["python", "app.py"]