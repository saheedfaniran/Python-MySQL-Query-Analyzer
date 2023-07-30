# Use the official Python base image with your desired Python version.
# Replace "3.9" with the Python version your app requires.
FROM python:3.9

# Set a working directory in the container for your app.
WORKDIR /app

# Copy the requirements.txt file first to leverage Docker's cache
# when the dependencies haven't changed.
COPY requirements.txt .

# Install the Python app dependencies.
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app's source code to the container.
# Adjust the source code directory name accordingly.
COPY . .

# Expose the port that your app is running on.
# Make sure to replace "8000" with the actual port your app listens on.
EXPOSE 8000

# Set any environment variables your app needs.
# For example, you might want to set a production environment variable.
# ENV MY_APP_ENV=production

# Command to run your Python app.
# Replace "app.py" with the entry point of your app.
CMD ["python", "app.py"]
