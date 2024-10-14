# Use an official Python 3.6 image as the base
FROM python:3.6-slim

# Set environment variables for non-interactive installs
ENV DEBIAN_FRONTEND=noninteractive

# Install Java 11, curl, and dependencies
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk curl gnupg2 libmagic-dev && \
    curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

# Install the specific npm version 6.14.4
RUN npm install -g npm@6.14.4

# Verify npm version
RUN npm --version

# Install Ghidra
RUN curl -L https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.1.2_build/ghidra_10.1.2_PUBLIC_20220125.zip \
    -o ghidra.zip && \
    apt-get install -y unzip && \
    unzip ghidra.zip -d /opt && \
    rm ghidra.zip

# Set Ghidra environment variable
ENV GHIDRA_HOME=/opt/ghidra_10.1.2_PUBLIC

# Copy the project files
WORKDIR /app
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Navigate to the jpsparse directory, install npm dependencies, and run npm start
WORKDIR /app/exec_pth_rec/jpsparse
RUN npm install

# Start the npm server in the background
CMD npm start &

# Return to the app directory and set the command to run main.py, allowing arguments
WORKDIR /app

# Set the default command to run the script, allowing arguments
ENTRYPOINT ["python", "main.py"]
