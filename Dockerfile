# Gunakan Node.js versi 10 agar kompatibel dengan GitBook
FROM node:10-alpine

# Install gitbook-cli
RUN npm install -g gitbook-cli@2.3.2

# Set working directory
WORKDIR /app

# Copy semua file ke container
COPY . .

# Install plugin GitBook (jika ada)
RUN gitbook install || true

# Build ke folder _book
RUN gitbook build . ./_book

# Jalankan static server
RUN npm install -g serve
EXPOSE 3021
CMD ["serve", "-s", "_book", "-l", "3021"]
