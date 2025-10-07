FROM node:10-alpine

RUN npm install -g gitbook-cli@2.3.2 serve

WORKDIR /app
COPY . .

RUN gitbook install || true
RUN gitbook build . ./_book || true  # pakai || true biar build gak gagal cuma karena 1 page error

EXPOSE 3021
CMD ["npx", "serve", "-s", "_book", "-l", "3021"]
