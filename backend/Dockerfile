FROM golang:alpine AS build

WORKDIR /go-kernel-server

COPY . ./

RUN go build .

EXPOSE 8080

CMD ["./main"]

# docker build -t codedy/delgo .
# docker run -p 8080:8080 --name goserver codedy/delgo
