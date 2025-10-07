# Gunakan Node versi 14 agar kompatibel dengan GitBook
FROM node:14-alpine

# Install GitBook CLI dan serve
RUN npm install -g gitbook-cli@2.3.2 serve

WORKDIR /app
COPY . .

# Install plugin GitBook
RUN gitbook install || true

# Build GitBook
RUN gitbook build . ./_book || true

# Buat direktori _book jika belum ada
RUN mkdir -p _book

# Fallback jika index.html belum dibuat
RUN [ -f "./_book/index.html" ] || echo "<h1>GitBook build failed</h1>" > ./_book/index.html

# Expose port
EXPOSE 3021

# Jalankan static server
CMD ["npx", "serve", "-s", "_book", "-l", "3021"]
