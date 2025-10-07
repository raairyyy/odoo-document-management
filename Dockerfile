# Gunakan versi Node yang lebih baru
FROM node:16

WORKDIR /app

COPY . .

# Install gitbook-cli & serve
RUN npm install -g gitbook-cli@2.3.2 serve@14.2.5

# Fetch versi gitbook yang stabil (gunakan versi 3.2.3 dari lokal cache gitbook-cli)
RUN gitbook fetch 3.2.3 || true

# Build buku GitBook
RUN gitbook install && gitbook build

# Jalankan server statis di port 4000
EXPOSE 3021
CMD ["serve", "_book", "-l", "3021"]
