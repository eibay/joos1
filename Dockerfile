# Use the official .NET Core SDK as a parent image
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Build the application and publish it
RUN dotnet publish -c Release -o out

# Use a smaller runtime image as a parent image
FROM mcr.microsoft.com/dotnet/aspnet:5.0

# Set the working directory to /app
WORKDIR /app

# Copy the published app from the build environment
COPY --from=build-env /app/out .

# Specify the entry point for your application
ENTRYPOINT ["dotnet", "Joos.dll"]
