# Gunakan Node.js LTS yang stabil dan ringan
FROM node:14-alpine

WORKDIR /app
COPY . .

# Install GitBook CLI & serve
RUN npm install -g gitbook-cli@2.3.2 serve@14.2.5

# Patch bug cb.apply() sebelum jalan
RUN sed -i 's/cb.apply(this, arguments)/if(typeof cb==="function")cb.apply(this, arguments)/' \
    $(npm root -g)/gitbook-cli/node_modules/npm/node_modules/graceful-fs/polyfills.js

# Fetch GitBook & install dependencies
RUN gitbook fetch 3.2.3 || true
RUN gitbook install || true

# Build GitBook (kalau gagal, bikin index.html biar nggak blank)
RUN gitbook build . ./_book || (echo "<h1>GitBook build failed</h1>" > ./_book/index.html)

# Jalankan hasil build lewat serve di port 3021
EXPOSE 3021
CMD ["serve", "-s", "_book", "-l", "3021"]
