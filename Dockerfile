# Gunakan Node LTS terbaru yang masih kompatibel
FROM node:16-alpine

# Set working directory
WORKDIR /app

# Copy seluruh file ke container
COPY . .

# Install dependensi utama
RUN npm install -g gitbook-cli@2.3.2 http-server@0.12.3

# Fix: pakai GitBook versi stabil (3.2.3)
RUN gitbook fetch 3.2.3

# Install plugin bawaan + plugin embed manual
RUN gitbook install || true
RUN npm install gitbook-plugin-embed@1.0.0 || true

# Build GitBook
RUN gitbook build ./ ./_book

# Expose port untuk http-server
EXPOSE 4000

# Jalankan server untuk menampilkan hasil build
CMD ["http-server", "_book", "-p", "4000", "-a", "0.0.0.0"]
