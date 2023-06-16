FROM python:3.9-slim

ENV MYSQL_HOST=34.128.70.106
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=123
ENV MYSQL_DATABASE=test

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

RUN pip install --upgrade pip



# Install the dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        default-libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

# Set the entrypoint command
CMD ["python", "main.py"]