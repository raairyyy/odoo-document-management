# Gunakan Node.js versi lama agar kompatibel dengan GitBook
FROM node:10-alpine

WORKDIR /app

# Copy file proyek ke dalam container
COPY . .

# Install GitBook dan server statis
RUN npm install -g gitbook-cli@2.3.2 http-server@0.12.3

# Instal plugin GitBook (hindari bug callback)
RUN gitbook fetch 3.2.3 && gitbook install || true

# Build GitBook ke folder _book
RUN gitbook build ./ ./_book || true

# Expose port untuk Coolify
EXPOSE 4000

# Jalankan GitBook dengan http-server
CMD ["npx", "http-server", "_book", "-p", "4000", "-a", "0.0.0.0"]
