# Étape 1 : build de l'application
FROM node:18 AS build

WORKDIR /aws

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Étape 2 : servir l'app avec "serve"
FROM node:18

RUN npm install -g serve

WORKDIR /aws

COPY --from=build /aws/build .

EXPOSE 3000

CMD ["serve", "-s", ".", "-l", "3000"]
