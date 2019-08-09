FROM usvc/mkdocs:latest
WORKDIR /app
COPY ./mkdocs.yml /app
COPY ./docs /app/docs
ENTRYPOINT [ "mkdocs" ]