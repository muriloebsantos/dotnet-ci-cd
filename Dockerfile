FROM microsoft/dotnet:2.2-sdk-alpine

RUN mkdir /app
WORKDIR /app

COPY dotnet-ci-cd.csproj .
RUN dotnet restore

COPY . .
RUN dotnet publish -c Release -o out

EXPOSE 80/tcp
CMD ["dotnet", "out/dotnet-ci-cd.dll"]

