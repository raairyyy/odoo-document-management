# Gunakan Node 14 karena GitBook 3.2.3 tidak kompatibel dengan Node 18+
FROM node:14-alpine

WORKDIR /app

# Copy package.json kalau ada (optional, kalau tidak ada di repo kamu bisa hapus baris ini)
COPY package*.json ./

# Install GitBook CLI dan server statis
RUN npm install -g gitbook-cli http-server

# Copy semua file GitBook
COPY . .

# Build GitBook ke folder _book
RUN gitbook install && gitbook build ./ ./_book

# Expose port 4000 (Coolify akan map otomatis)
EXPOSE 4000

# Jalankan hasil build dengan http-server
CMD ["http-server", "_book", "-p", "4000"]
