# Gunakan versi Node yang stabil buat GitBook lawas
FROM node:12-buster

WORKDIR /app
COPY . .

# Gunakan npm versi lawas yang cocok
RUN npm install -g npm@6

# Install GitBook CLI versi stabil
RUN npm install -g gitbook-cli@2.3.2 serve@14.2.5

# Fetch versi GitBook stabil (3.2.3)
RUN gitbook fetch 3.2.3 || true

# Install plugin GitBook (abaikan error minor)
RUN gitbook install || true

# Build ke folder _book
RUN mkdir -p _book && gitbook build . ./_book || echo "<h1>GitBook build failed</h1>" > ./_book/index.html

# Expose port 3021
EXPOSE 3021

# Serve hasil build
CMD ["serve", "-s", "_book", "-l", "3021"]
