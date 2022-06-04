FROM node:alpine
WORKDIR /app
COPY package.json ./
COPY ./ ./
RUN npm i
RUN npm install next react react-dom --save
CMD ["npm", "run", "build"]
CMD ["npm", "run", "start"]
