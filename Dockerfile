# Use base image
FROM node:18-slim

# Set working directory
WORKDIR /app

# Copy files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of code
COPY . .

# Run app
CMD ["node", "app.js"]
