FROM node:14-alpine

WORKDIR /app
COPY . .

# Install GitBook CLI & serve
RUN npm install -g gitbook-cli@2.3.2 serve@14.2.5

# Patch bug "cb.apply is not a function"
RUN sed -i 's/if (cb) cb.apply(this, arguments)/if (cb && typeof cb === "function") cb.apply(this, arguments)/' \
    $(npm root -g)/gitbook-cli/node_modules/npm/node_modules/graceful-fs/polyfills.js || true

# Fetch GitBook version dan install dependensi
RUN gitbook fetch 3.2.3 || true
RUN gitbook install || true

# Pastikan folder _book ada dulu sebelum fallback HTML
RUN mkdir -p ./_book

# Build GitBook (kalau gagal, bikin halaman fallback)
RUN gitbook build . ./_book || (echo "<h1>GitBook build failed</h1>" > ./_book/index.html)

# Serve hasil build
EXPOSE 3021
CMD ["serve", "-s", "_book", "-l", "3021"]
