FROM node:18-alpine

EXPOSE 3000

WORKDIR /app
COPY . .

ENV NODE_ENV=production

RUN npm i @shopify/polaris-icons
run npm i jquery

RUN npm install 
# Remove CLI packages since we don't need them in production by default.
# Remove this line if you want to run CLI commands in your container.

RUN npm run build

# You'll probably want to remove this in production, it's here to make it easier to test things!
RUN rm -f prisma/dev.sqlite
cmd node /extensions/app-ex1/assets/server.js



CMD ["npm", "run", "docker-start"]
