FROM node:10-alpine

# Install gitbook-cli
RUN npm install -g gitbook-cli@2.3.2

WORKDIR /app
COPY . .

# Install plugin GitBook (ignore error)
RUN gitbook install || true

# Build ke folder _book
RUN gitbook build . ./_book

# Jalankan server statis di port 3021
EXPOSE 3021
CMD npx serve -s _book -l 3021
