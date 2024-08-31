# Build stage: This stage is responsible for restoring dependencies and publishing the .NET application.
# The --platform=$BUILDPLATFORM argument is used for cross-platform builds.
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# ARG: TARGETARCH is an argument used for specifying the target architecture, useful in cross-platform builds.
ARG TARGETARCH

# Set the working directory inside the container for the build process.
WORKDIR /source

# Copy the .csproj file(s) to the working directory.
# This is done separately to take advantage of Docker's layer caching, so that if only code changes, 
# we don’t need to restore the packages again.
COPY aspnetapp/*.csproj .

# Restore the dependencies based on the .csproj file(s).
# The -a $TARGETARCH flag ensures that the restore process is aware of the target architecture.
RUN dotnet restore -a $TARGETARCH

# Copy the entire source code into the working directory.
COPY aspnetapp/. .

# Publish the .NET application. 
# The --no-restore flag skips the restore step since it was already done.
# The -a $TARGETARCH flag is used again to publish for the target architecture.
# The output is placed in the /app directory within the container.
RUN dotnet publish --no-restore -a $TARGETARCH -o /app

# Runtime stage: This stage creates the final image that will run the .NET application.
FROM mcr.microsoft.com/dotnet/aspnet:8.0

# Expose port 8080 for the application to listen on.
EXPOSE 8080

# Set the working directory inside the container for the runtime environment.
WORKDIR /app

# Copy the published application from the build stage into the runtime stage.
COPY --from=build /app .

# Set the entry point for the container to the published application.
# The application is started when the container is run.
ENTRYPOINT ["./aspnetapp"]
