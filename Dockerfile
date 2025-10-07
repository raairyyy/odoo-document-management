FROM node:12-alpine

RUN npm install -g gitbook-cli@2.3.2 serve@11.3.2
WORKDIR /app
COPY . .
RUN gitbook install || true
RUN gitbook build . ./_book || true
RUN mkdir -p ./_book && [ -f "./_book/index.html" ] || echo "<h1>GitBook build failed</h1>" > ./_book/index.html
CMD ["serve", "-s", "_book", "-l", "3021"]
