FROM node:10-alpine

# Install gitbook-cli
RUN npm install -g gitbook-cli@2.3.2 serve

WORKDIR /app
COPY . .

# Install plugin (abaikan error plugin deprecated)
RUN gitbook install || true

# Build GitBook ke folder _book
RUN gitbook build . ./_book

# Expose port 3021 (Coolify listen di sini)
EXPOSE 3021

# Jalankan server statis untuk hasil build
CMD ["npx", "serve", "-s", "_book", "-l", "3021"]
