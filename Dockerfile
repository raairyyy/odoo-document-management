# Base image Node.js
FROM node:18-alpine

# Install gitbook-cli
RUN npm install -g gitbook-cli@2.3.2

# Set working directory
WORKDIR /app

# Copy semua file ke container
COPY . .

# Install plugin GitBook (kalau ada)
RUN gitbook install || true

# Build ke folder _book
RUN gitbook build . ./_book

# Jalankan static server
RUN npm install -g serve
EXPOSE 3000
CMD ["serve", "-s", "_book", "-l", "3000"]
