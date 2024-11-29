FROM alpine:latest

ARG USERNAME=x

COPY ./script/user/init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh && /tmp/init.sh

COPY ./script/user/init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh && /tmp/init.sh

COPY ./script/user/setup.sh /tmp/setup.sh

RUN apk add --no-cache \
    bash \
    curl \
    wget \
    git


# remove the `.tmp` dir. don't use `tmp` because it's a reserved directory name
# e.g. `CodeLLDB` is not working properly when the `tmp` directory is removed
RUN rm -rf /tmp/scripts/

CMD [ "tail", "-f", "/dev/null" ]
