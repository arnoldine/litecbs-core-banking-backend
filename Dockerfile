# Use the official .NET 8 SDK image to build the application
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy solution file
COPY ["LiteCBS.sln", "./"]
COPY ["global.json", "./"]

# Copy project files
COPY ["src/LiteCBS.Api/LiteCBS.Api.csproj", "src/LiteCBS.Api/"]
COPY ["src/LiteCBS.Core/LiteCBS.Core.csproj", "src/LiteCBS.Core/"]
COPY ["src/LiteCBS.Infrastructure/LiteCBS.Infrastructure.csproj", "src/LiteCBS.Infrastructure/"]
COPY ["src/Modules/Licensing/LiteCBS.Modules.Licensing.csproj", "src/Modules/Licensing/"]
COPY ["src/Modules/IdentityAndKyc/LiteCBS.Modules.IdentityAndKyc.csproj", "src/Modules/IdentityAndKyc/"]
COPY ["src/Modules/Accounts/LiteCBS.Modules.Accounts.csproj", "src/Modules/Accounts/"]
COPY ["src/Modules/Payments/LiteCBS.Modules.Payments.csproj", "src/Modules/Payments/"]
COPY ["src/Modules/Cards/LiteCBS.Modules.Cards.csproj", "src/Modules/Cards/"]
COPY ["src/Modules/Compliance/LiteCBS.Modules.Compliance.csproj", "src/Modules/Compliance/"]

# Restore dependencies
RUN dotnet restore "src/LiteCBS.Api/LiteCBS.Api.csproj"

# Copy everything else and build
COPY . .
WORKDIR "/src/src/LiteCBS.Api"
RUN dotnet build "LiteCBS.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "LiteCBS.Api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "LiteCBS.Api.dll"]
