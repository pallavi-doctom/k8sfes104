# Step 1: Build stage (Node.js for React/Vite)
FROM node:18 AS build-stage
WORKDIR /app

# Install git to allow repo cloning
RUN apt-get update && apt-get install -y git

# Clone your frontend repo
RUN git clone https://github.com/pallavi-doctom/k8sfes104.git .

# Move into the actual frontend directory (where package.json exists)
WORKDIR /app/K8S_Ecommerce_Frontend

# Install dependencies and build the React app
RUN npm install
RUN npm run build

# Step 2: Runtime stage (Tomcat for serving)
FROM tomcat:9-jdk17
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy React build output into Tomcat webapps
COPY --from=build-stage /app/K8S_Ecommerce_Frontend/dist /usr/local/tomcat/webapps/ecommerce

EXPOSE 8082
CMD ["catalina.sh", "run"]
