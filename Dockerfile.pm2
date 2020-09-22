FROM node:12-slim
LABEL maintainer="Gem Huang <gemhuang@iii.org.tw>"

# Install pm2
RUN npm install pm2 -g

# Expose ports needed to use Keymetrics.io
EXPOSE 3000

COPY . /app

WORKDIR /app

RUN npm install

# Start pm2.json process file
CMD ["pm2-runtime", "start", "pm2.json"]
