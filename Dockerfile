# Gunakan Node.js 14 (GitBook 3.2.3 tidak support versi baru)
FROM node:14-alpine

# Set working directory
WORKDIR /app

# Salin semua file ke container
COPY . .

# Install gitbook-cli dan http-server
RUN npm install -g gitbook-cli@2.3.2 http-server@0.12.3

# Perbaiki error cb.apply dengan downgrade npm dan graceful-fs
RUN npm install -g npm@6
RUN npm install graceful-fs@4.2.6

# Install GitBook versi stabil
RUN gitbook fetch 3.2.3 || true

# Install plugin dari book.json
RUN gitbook install || true

# Build GitBook ke folder _book
RUN gitbook build ./ ./_book || true

# Jalankan server statis di port 4000
EXPOSE 4000
CMD ["http-server", "_book", "-p", "4000"]
