# Use an official Node.js runtime as a parent image
FROM node:16 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React app for production
RUN npm run build

# Use a lightweight HTTP server to serve the production build
FROM nginx:alpine

# Copy the build folder to nginx's default HTML location
COPY --from=builder /app/build /usr/share/nginx/html

# Expose port 80 for the production server
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]
