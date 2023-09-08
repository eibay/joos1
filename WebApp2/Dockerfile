# Use the official .NET 6 SDK image as a build stage
# FROM mcr.microsoft.com/dotnet/core/sdk:6.0-alpine AS build
FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
# Set the working directory to /app
WORKDIR /app

# Copy the .csproj and restore any dependencies (if using .csproj)
COPY *.csproj ./
RUN dotnet restore

# Copy the remaining source code
COPY . .

# Build the application in Release mode
RUN dotnet publish -c Release -o out

# Use the official .NET 6 runtime image as the final stage
FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the published application from the build stage to the final stage
COPY --from=build /app/out .

# Specify the entry point for your application
ENTRYPOINT ["dotnet", "WebApp2.dll"]
