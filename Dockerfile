# ─────────────────────────────────────
# Stage 1: Install dependencies
# ─────────────────────────────────────
FROM node:20-alpine AS deps

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

# ─────────────────────────────────────
# Stage 2: Final lightweight image
# ─────────────────────────────────────
FROM node:20-alpine

WORKDIR /app

# Install curl (Alpine uses apk, not apt)
RUN apk add --no-cache curl

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy dependencies + app code
COPY --from=deps /app/node_modules ./node_modules
COPY . .

# Set ownership
RUN chown -R appuser:appgroup /app

# Switch to non-root user
USER appuser

# Expose port (make sure your app uses this)
EXPOSE 3000

# Start application
CMD ["node", "app/app.js"]
