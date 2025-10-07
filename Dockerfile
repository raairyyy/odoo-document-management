# Gunakan base image Node.js versi stabil (LTS)
FROM node:10-alpine

WORKDIR /app

# Copy semua file ke container
COPY . .

# Install gitbook CLI dan HTTP server
RUN npm install -g gitbook-cli@2.3.2 http-server@0.12.3

# Install versi GitBook yang cocok + plugin embed
RUN gitbook fetch 3.2.3 \
 && gitbook install \
 && npm install gitbook-plugin-embed@1.0.0 \
 && gitbook build ./ ./_book

# Expose port untuk Coolify
EXPOSE 4000

# Jalankan http-server untuk serve hasil build
CMD ["http-server", "_book", "-p", "4000", "-a", "0.0.0.0"]
