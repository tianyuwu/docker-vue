FROM node:8.11.3
RUN apt-get clean && apt-get update
RUN apt-get install -y nginx
WORKDIR /app
COPY . /app/
EXPOSE 80
RUN npm install -g cnpm --registry=https://http://registry.npm.taobao.org \
&& cnpm install \
&& cnpm run build \
&& cp -r dist/* /var/www/html \
&& rm -rf /app
CMD ["nginx","-g","daemon off;"]