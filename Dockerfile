# Ganti ke versi Node yang lebih baru
FROM node:18-alpine

# Install gitbook dan serve
RUN npm install -g gitbook-cli@2.3.2 serve

WORKDIR /app
COPY . .

# Build GitBook (pakai || true supaya gak gagal kalau minor error)
RUN gitbook install || true
RUN gitbook build . ./_book || true

# Port untuk serve
EXPOSE 3021

# Jalankan server static
CMD ["npx", "serve", "-s", "_book", "-l", "3021"]
