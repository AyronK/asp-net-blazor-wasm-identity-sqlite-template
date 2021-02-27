#docker run -p 8000:80 -p 8001:443
FROM mcr.microsoft.com/dotnet/sdk:5.0-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443
ENV ASPNETCORE_ENVIRONMENT="Docker"
ENV ASPNETCORE_URLS="https://+:443;http://+:80"

FROM mcr.microsoft.com/dotnet/sdk:5.0-buster-slim AS build
    
COPY /data/SQLite.dev.db /data/SQLite.dev.db
WORKDIR /src
COPY . .
RUN dotnet restore "src/Server/MoneyTale.Server/MoneyTale.Server.csproj"
RUN dotnet build "src/Server/MoneyTale.Server/MoneyTale.Server.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "src/Server/MoneyTale.Server/MoneyTale.Server.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
COPY --from=build /data/SQLite.dev.db .
EXPOSE 8080
ENTRYPOINT ["dotnet", "MoneyTale.Server.dll"]
