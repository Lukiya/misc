#FROM scratch
FROM alpine
ADD zoneinfo.tar.gz /
RUN cp /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
WORKDIR /app
COPY main ./
ENTRYPOINT ["./main"]