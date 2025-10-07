# Gunakan Node.js 18 (modern & stabil)
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Salin file dependency
COPY package*.json ./

# Install GitBook dan HTTP Server
RUN npm install -g gitbook-cli http-server && npm install

# Salin semua file project
COPY . .

# Build GitBook ke folder _book
RUN npx gitbook build ./ ./_book

# Expose port 4000 (Coolify akan map ke domain otomatis)
EXPOSE 4000

# Jalankan server untuk hasil _book
CMD ["npx", "http-server", "_book", "-p", "4000"]
