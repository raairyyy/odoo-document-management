# Gunakan Node.js 14 (stabil untuk GitBook)
FROM node:14-alpine

# Set working directory
WORKDIR /app

# Copy seluruh project
COPY . .

# Downgrade npm dulu supaya kompatibel dengan gitbook-cli
RUN npm install -g npm@6

# Install GitBook CLI dan HTTP Server
RUN npm install -g gitbook-cli@2.3.2 http-server@0.12.3

# Fetch GitBook versi 3.2.3 (paling stabil)
RUN gitbook fetch 3.2.3 || true

# Install plugin-plugin dari book.json
RUN gitbook install || true

# Build GitBook ke folder _book
RUN gitbook build ./ ./_book || true

# Expose port 4000 untuk Coolify
EXPOSE 4000

# Jalankan server
CMD ["http-server", "_book", "-p", "4000", "-a", "0.0.0.0"]
