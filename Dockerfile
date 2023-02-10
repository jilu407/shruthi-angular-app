FROM node AS shruthi
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
RUN ls

# stage 2

FROM nginx
COPY --from=shruthi /app/dist/shruthi-app/ /usr/share/nginx/html/
