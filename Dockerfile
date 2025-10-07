# Gunakan Node.js 14 (kompatibel penuh dengan GitBook)
FROM node:14-alpine

# Set working directory
WORKDIR /app

# Copy seluruh file ke container
COPY . .

# Install gitbook-cli dan http-server
RUN npm install -g gitbook-cli@2.3.2 http-server@0.12.3

# Install GitBook versi stabil (3.2.3)
RUN gitbook fetch 3.2.3 || true

# Install plugin-plugin yang ada di book.json
RUN gitbook install || true

# Build GitBook ke folder _book
RUN gitbook build ./ ./_book

# Expose port 4000 untuk Coolify
EXPOSE 4000

# Jalankan server untuk menampilkan hasil build
CMD ["http-server", "_book", "-p", "4000", "-a", "0.0.0.0"]
