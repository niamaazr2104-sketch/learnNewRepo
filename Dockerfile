FROM gcc:latest AS build
WORKDIR /app
COPY expo.c .
RUN gcc -static -o expo expo.c -ln
FROM scratch
ARG VERSION=0.1
LABEL version="${VERSION}"
COPY --from=build /app/expo /expo
USER 65534:65534
ENTRYPOINT ["/expo"]
