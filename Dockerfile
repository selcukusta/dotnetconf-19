FROM mcr.microsoft.com/dotnet/core/sdk:2.2-alpine as build-ENV
COPY . ./app
WORKDIR /app
RUN dotnet publish -c Release -r linux-musl-x64 -o publish-folder
FROM mcr.microsoft.com/dotnet/core/runtime-deps:2.2-alpine as runtime
COPY --from=build-env /app/publish-folder ./
RUN apk add --update \
    iputils \
    icu-libs \
    && rm -rf /var/cache/apk/*
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false
ENV ASPNETCORE_URLS=http://+:80
EXPOSE 80/TCP
ENTRYPOINT ["./DotnetConf"]