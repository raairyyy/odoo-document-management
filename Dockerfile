FROM node:14-alpine

WORKDIR /app
COPY . .

# 🔧 downgrade npm agar kompatibel dengan gitbook-cli lawas
RUN npm install -g npm@6

# 🧱 install GitBook CLI & serve versi stabil
RUN npm install -g gitbook-cli@2.3.2 serve@14.2.5

# 🔽 fetch gitbook versi stabil
RUN gitbook fetch 3.2.3 || true

# 📦 install plugin
RUN gitbook install || true

# 🏗️ build gitbook
RUN mkdir -p _book && \
    gitbook build . ./_book || echo "<h1>GitBook build failed</h1>" > ./_book/index.html

# 🌐 expose port 3021
EXPOSE 3021

# 🚀 serve hasil build di port 3021
CMD ["serve", "-s", "_book", "-l", "3021"]
