FROM node:10-alpine

WORKDIR /app
COPY . .

# 🧱 Install GitBook CLI & serve
RUN npm install -g gitbook-cli@2.3.2 serve@14.2.5

# 📦 Install plugin (tanpa fetch, langsung build)
RUN gitbook install || true

# 🏗️ Build GitBook, buat _book biar ga error kalau gagal
RUN mkdir -p _book && \
    gitbook build . ./_book || echo "<h1>GitBook build failed</h1>" > ./_book/index.html

EXPOSE 3021
CMD ["serve", "-s", "_book", "-l", "3021"]
