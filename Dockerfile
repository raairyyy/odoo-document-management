# Gunakan base image Node.js
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json (kalau ada)
COPY package*.json ./

# Install gitbook-cli global
RUN npm install -g gitbook-cli

# Install dependencies GitBook
RUN gitbook fetch 3.2.3

# Copy semua file ke container
COPY . .

# Build GitBook ke folder _book
RUN gitbook build . ./_book

# Expose port default GitBook
EXPOSE 3021

# Start GitBook serve
CMD ["gitbook", "serve", "./_book", "--port", "3021", "--lrport", "35729", "--no-live"]
