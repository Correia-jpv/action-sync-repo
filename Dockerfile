FROM ubuntu:18.04

RUN apt-get update && apt-get install -y git

COPY *.sh /

RUN chmod +x entrypoint.sh
RUN chmod +x sync_repo.sh

ENTRYPOINT ["/entrypoint.sh"]
