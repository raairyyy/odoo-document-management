# Gunakan versi Node yang kompatibel
FROM node:12

WORKDIR /app

COPY . .

# Instal GitBook CLI dan serve
RUN npm install -g gitbook-cli@2.3.2 serve@14.2.5

# Paksa GitBook versi stabil
RUN gitbook fetch 3.2.3 || true

# Build GitBook
RUN gitbook install && gitbook build

# Jalankan server statis
EXPOSE 3021
CMD ["serve", "_book", "-l", "3021"]
