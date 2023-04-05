# syntax=docker/dockerfile:1
   
FROM node:latest
COPY start.sh start.sh
EXPOSE 3000
ENTRYPOINT ["/bin/bash", "start.sh"]