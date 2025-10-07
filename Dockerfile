# Gunakan Node versi 14 (GitBook 3.2.3 hanya jalan di sini)
FROM node:14-alpine

WORKDIR /app

# Install GitBook CLI
RUN npm install -g gitbook-cli

# Fetch GitBook versi 3.2.3
RUN gitbook fetch 3.2.3

# Copy semua file ke container
COPY . .

# Build buku ke folder _book
RUN gitbook build . /app/_book

# Serve hasil build pakai server statis
RUN npm install -g serve

EXPOSE 4000
CMD ["serve", "-s", "_book", "-l", "4000"]
