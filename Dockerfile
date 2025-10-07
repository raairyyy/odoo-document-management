# Gunakan Node 14 (GitBook masih bisa asal dikasih patch)
FROM node:14-buster

WORKDIR /app
COPY . .

# Install versi npm & gitbook-cli yang cocok
RUN npm install -g npm@6 gitbook-cli@2.3.2 http-server@14.1.1

# Patch fix supaya GitBook bisa jalan di Node 14
RUN npm install graceful-fs@4.2.2 --save

# Fetch dan install plugin GitBook
RUN gitbook fetch 3.2.3 || true
RUN gitbook install || true

# Build ke folder _book
RUN mkdir -p _book && gitbook build . ./_book || echo "<h1>GitBook build failed</h1>" > ./_book/index.html

# Expose port 3021
EXPOSE 3021

# Serve hasil build pake http-server
CMD ["http-server", "_book", "-p", "3021"]
