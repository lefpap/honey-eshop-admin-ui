# Use an official Node.js runtime as a parent image
FROM node:18

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the admin UI with Vite
RUN npm run build

# Expose the port that Vite uses (3000 by default)
EXPOSE 3000

# Serve the built app using a static file server (like serve)
RUN npm install -g serve
CMD ["serve", "-s", "dist"]
