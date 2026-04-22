# 1. Build Stage
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy project file and restore dependencies
COPY HOLLOW_OCTAGONAL_PYRAMID_CALCULATOR.csproj .
RUN dotnet restore HOLLOW_OCTAGONAL_PYRAMID_CALCULATOR.csproj

# Copy the rest of the source code and build
COPY . .
RUN dotnet build "HOLLOW_OCTAGONAL_PYRAMID_CALCULATOR.csproj" -c Release -o /app/build

# 2. Publish Stage
FROM build AS publish
RUN dotnet publish "HOLLOW_OCTAGONAL_PYRAMID_CALCULATOR.csproj" -c Release -o /app/publish

# 3. Runtime Stage
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=publish /app/publish .

# Render port binding
ENV ASPNETCORE_URLS=http://+:${PORT:-8080}
EXPOSE 8080

ENTRYPOINT ["dotnet", "HOLLOW_OCTAGONAL_PYRAMID_CALCULATOR.dll"]