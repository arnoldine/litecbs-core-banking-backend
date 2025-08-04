# LiteCBS - Enterprise Core Banking Backend

## Overview
LiteCBS is an enterprise-grade, modular core banking backend built with ASP.NET Core 8, Minimal API, and Entity Framework Core. It provides a comprehensive banking platform with RESTful APIs, JWT authentication, and modular architecture.

## Features
- **Modular Architecture**: Service-oriented design with separate modules for different banking functions
- **RESTful APIs**: RESTful Open Banking API using Minimal API
- **JWT Authentication**: JWT authentication for clients with OAuth 2.0 ready support
- **Modular Design**: Separate modules for Licensing, Identity & KYC, Accounts, Payments, Cards, and Compliance
- **Cloud-Native**: Ready for cloud deployment with Docker support
- **Banking Features**: Complete banking platform with account management, payments, cards, and compliance features

## Architecture
```
LiteCBS/
├── src/
│   ├── LiteCBS.Api/           # Main API application
│   ├── LiteCBS.Core/          # Shared domain primitives
│   ├── LiteCBS.Infrastructure/ # EF Core and repositories
│   └── Modules/
│       ├── Licensing/          # License management
│       ├── IdentityAndKyc/   # Identity and KYC management
│       ├── Accounts/           # Account management
│       ├── Payments/           # Payment processing
│       ├── Cards/              # Card management
│       └── Compliance/         # Compliance and reporting
├── tests/                      # Test projects
└── docker-compose.yml          # Docker configuration
```

## Getting Started

### Prerequisites
- .NET 8 SDK
- PostgreSQL
- Docker (optional)

### Installation
1. Clone the repository
2. Install dependencies: `dotnet restore`
3. Run the application: `dotnet run --project src/LiteCBS.Api`

### Docker Setup
1. Build the Docker image: `docker build -t litecbs .`
2. Run with Docker Compose: `docker-compose up`

### Database Setup
1. Run migrations: `dotnet ef database update`
2. Seed data: `dotnet run --project src/LiteCBS.Api --seed`

## API Endpoints
- **Authentication**: `/api/auth/*`
- **Accounts**: `/api/accounts/*`
- **Payments**: `/api/payments/*`
- **Cards**: `/api/cards/*`
- **Compliance**: `/api/compliance/*`

## Development
- **Database**: PostgreSQL with EF Core
- **Authentication**: JWT with .NET Identity
- **API Documentation**: Swagger/OpenAPI
- **Testing**: xUnit with integration tests

## Contributing
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License
MIT License
