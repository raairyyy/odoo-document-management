FROM node:14-alpine

WORKDIR /app
COPY . .

# Install GitBook CLI & Serve (versi yang stabil)
RUN npm install -g gitbook-cli@2.3.2 serve@14.2.5

# Gunakan gitbook versi stabil 3.2.3
RUN gitbook fetch 3.2.3

# Install plugin & dependencies
RUN gitbook install || true

# Build GitBook
RUN mkdir -p _book && \
    gitbook build . ./_book || echo "<h1>GitBook build failed</h1>" > ./_book/index.html

# Expose ke port 3021
EXPOSE 3021

# Jalankan server statis hasil build
CMD ["serve", "-s", "_book", "-l", "3021"]
