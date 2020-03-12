FROM usvc/mkdocs:material-latest
ARG USER_ID=root
RUN apk add --no-cache shadow \
  && if ! cat /etc/passwd | grep ${USER_ID}; then \
      adduser -u ${USER_ID} -D -h /home/${USER_ID} ${USER_ID}; fi \
  && mkdir -p /app \
  && chown ${USER_ID}:${USER_ID} -R /app \
  && apk del --no-cache shadow
COPY --chown=${USER_ID}:${USER_ID} ./mkdocs.yml /app
COPY --chown=${USER_ID}:${USER_ID} ./docs /app/docs
USER ${USER_ID}
WORKDIR /app
ENTRYPOINT [ "mkdocs" ]
