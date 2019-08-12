FROM usvc/mkdocs:material-latest 
WORKDIR /app
COPY ./mkdocs.yml /app
COPY ./docs /app/docs
ENTRYPOINT [ "mkdocs" ]
