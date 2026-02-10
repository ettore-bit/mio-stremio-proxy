FROM node:20-alpine
WORKDIR /app
RUN apk add --no-cache git
RUN git clone https://github.com/DeeLMind/easyProxy.git . || echo "Use default"
RUN npm install || apk add --no-cache python3 make g++
COPY . .
EXPOSE 8080 8443
CMD ["npm", "start"] || ["node", "server.js"] || ["sh"]
