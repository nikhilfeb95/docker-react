#tag the phase as builder
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

#copy all dependencies from the install phase
COPY . .

#build the project
RUN npm run build


#Start the run phase
FROM nginx

# get the built files from the builder phase
COPY --from=builder /app/build /usr/share/nginx/html

