#Build stage
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
#Copy project files
COPY ["HOLLOW_OCTAGONAL_PYRAMID_CALCULATOR.csproj", "/"]
#Restore dependencies
RUN dotnet restore "HOLLOW_OCTAGONAL_PYRAMID_CALCULATOR.csproj"
#Copy source code
COPY
#Build the application
RUN dotnet build "HOLLOW_OCTAGONAL_PYRAMID_CALCULATOR.csproj" c Release -o/app/build
#Publish stage
FROM build AS publish
RUN dotnet publish "HOLLOW_OCTAGONAL_PYRAMID_CALCULATOR.csproj" -c Release -o/app/publish
#Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY-from-publish/app/publish
#Expose port (Render will set PORT env var)
EXPOSE 8080
ENV ASPNETCORE_URLS-http://+:8080
ENTRYPOINT ["dotnet", "HOLLOW_OCTAGONAL_PYRAMID_CALCULATOR.dll"]