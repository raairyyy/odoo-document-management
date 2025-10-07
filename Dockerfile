# Gunakan Node.js versi modern
FROM node:16-alpine

# Install GitBook CLI dari fork yang sudah fix, dan serve
RUN npm install -g gitbook-cli serve

# Set working directory
WORKDIR /app

# Copy semua file project
COPY . .

# Bersihkan cache & install dependencies GitBook
RUN gitbook fetch 3.2.3 || true
RUN gitbook install || true

# Build GitBook
RUN gitbook build . ./_book || (echo "<h1>GitBook build failed</h1>" > ./_book/index.html)

# Pastikan direktori build ada
RUN mkdir -p ./_book

# Expose port (buat Coolify)
EXPOSE 3021

# Jalankan hasil build di port 3021
CMD ["serve", "-s", "_book", "-l", "3021"]
