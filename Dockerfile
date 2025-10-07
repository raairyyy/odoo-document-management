# Gunakan Node versi stabil lama (GitBook 3.2.3 hanya jalan di Node 10/12)
FROM node:12-buster

WORKDIR /app

# Install GitBook CLI dan patch dependency fs lama
RUN npm install -g npm@6 && \
    npm install -g gitbook-cli@2.3.2 && \
    npm cache clean --force

# Buat folder gitbook manual biar gak perlu fetch/install
RUN mkdir -p /root/.gitbook/versions/3.2.3 && \
    gitbook fetch 3.2.3 || true

# Copy semua file project ke container
COPY . .

# Build buku ke folder _book
RUN gitbook build . /app/_book || true

# Install static server
RUN npm install -g serve

EXPOSE 4000
CMD ["serve", "-s", "_book", "-l", "4000"]
