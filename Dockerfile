# Gunakan image Debian, bukan Alpine
FROM node:14-buster

# Set workdir
WORKDIR /app

# Install GitBook CLI
RUN npm install -g gitbook-cli@2.3.2

# Jalankan satu kali agar GitBook 3.2.3 otomatis terinstall
RUN gitbook install

# Copy semua file project ke container
COPY . .

# Build buku ke folder _book
RUN gitbook build . /app/_book

# Install static server untuk serve hasil build
RUN npm install -g serve

# Expose port untuk Coolify
EXPOSE 4000

# Jalankan server static
CMD ["serve", "-s", "_book", "-l", "4000"]
