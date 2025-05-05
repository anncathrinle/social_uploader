# 1. Use a minimal Python image
FROM python:3.10-slim

# 2. Set working directory inside container
WORKDIR /app

# 3. Install any system dependencies you need
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/*

# 4. Copy your Python requirements and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of your app’s code
COPY . .

# 6. Expose the port Streamlit uses
EXPOSE 8501

# 7. Launch Streamlit in headless mode on port 8501
ENTRYPOINT ["streamlit", "run", "upload_app.py", "--server.port=8501", "--server.headless=true"]
