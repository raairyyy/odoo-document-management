# Gunakan Node versi 12 agar kompatibel dengan GitBook
FROM node:12

# Set working directory
WORKDIR /app

# Salin semua file ke container
COPY . .

# Install gitbook-cli dan serve
RUN npm install -g gitbook-cli serve

# Install GitBook 3.2.3 (versi stabil)
RUN gitbook fetch 3.2.3

# Install plugin GitBook (kalau ada plugin di book.json)
RUN gitbook install || true

# Build ke folder _book
RUN gitbook build . ./_book

# Expose port 3000 (bisa kamu ubah di Coolify)
EXPOSE 3021

# Jalankan hasil build dengan serve
CMD ["serve", "-s", "_book", "-l", "3021"]
