FROM usvc/mkdocs:material-latest
RUN apk add --no-cache git make
WORKDIR /app
COPY . /app
VOLUME ["/root/.ssh/id_rsa"]
ENTRYPOINT ["mkdocs"]
CMD ["gh-deploy"]
