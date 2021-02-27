# Money Tale

[![.NET CI](https://github.com/AyronK/asp-net-blazor-wasm-identity-sqlite-template/actions/workflows/dotnet-ci.yml/badge.svg?branch=main)](https://github.com/AyronK/asp-net-blazor-wasm-identity-sqlite-template/actions/workflows/dotnet-ci.yml)  
[![EF Migrations](https://github.com/AyronK/asp-net-blazor-wasm-identity-sqlite-template/actions/workflows/ef-migrations.yml/badge.svg?branch=main)](https://github.com/AyronK/asp-net-blazor-wasm-identity-sqlite-template/actions/workflows/ef-migrations.yml)

## Template
This repository can be used as a template for **ASP.NET 5** application with **Blazor WASM** SPA frontend. The solution and project files contain **Money Tale** as application name, but it can be easily changed by renaming all the projects and directories (remember about project references in .sln and .csproj files) as well as all string literals across the application. It should not be as time-consuming as setting up everything else!

### Template Content
_Powered by ASP.NET 5_  
   - **SQLite integration**  
     Thi application uses SQLite because it is more lightweight for smaller applications and easier to deploy to production without excessive funds.  
   - **ASP.NET Identity**  
     Integrated use of ASP.NET Identity library  
        - SQLite was chosen as a primary database for the template. It can be switched to other DB easily.  
        - Generated Identity views in a separate project `MoneyTale.Web.Identity` for easy control over those views.  
   - **Entity Framework**  
     An entry point for full usage in the application. In addition, ASP.NET Identity required it to deploy its schema. EF was set up to use SQLite as it was chosen as a primary database for the template. My choice is to use Entity Framework for Identity and maintaining changes to database schema only. You can choose it for data querying as well or choose any other library.  
   - **Swagger**  
     Integrated Swagger usage. See "Important endpoint" section to get started. You can also import generated OpenAPI3.0 file into a Postman or other API consuming application supporting OpenAPI3.0.
   - **Docker**  
     Enabled Docker support for running application with SPA altogether. There is only basic Docker support with HTTPS development certificate handler. If you need more complex Dockerfile, docker compose or any other improvement you are free to go from that point.  
   - **Analyzers**  
     Included Roslynator code analysis with a subjective set of rules that can be easily adjusted by modifying `/src/_shared.ruleset` file.  
   - **NUnit**  
     This template contains one NUnit project and a shared targets file for future projects. Feel free to use another testing library as well, just keep it all together in `/tests/_tests.targets` file to avoid duplicating references and using the same code analysis ruleset.  
   - **.NET repository directories structure**  
     This repository follows .NET recommended repository structure. See more at [gist](https://gist.github.com/davidfowl/ed7564297c61fe9ab814).  
   - **Shared targets for src and test projects**  
     Use a predifiened templates for new src projects adding `<Import Project="../_shared.targets" />` to your `.csproj`.
     Use a predifiened templates for new test projects adding `<Import Project="../_tests.targets" />` to your `.csproj` of NUnit project.   
     
#### CICD
_Powered by GitHub actions_  
   - **.NET Build and Test**  
     Action `dotnet-ci.yml` runs dotnet build and tests.  
   - **Entity Framework migrations**  
     Action `ef-migrations.yml` runs all migrations from scratch on an empty SQLite database placed in `/data` directory.  

_____

## Important endpoints  
- `/` root of Blazor App
- `/swagger` Swagger UI
- `/swagger/v1/swagger.json` OpenAPI3.0 file

## Running docker  
- run `docker build -t money-tale .` in root directory
- run `docker run -p 8000:80 -p 8001:443 money-tale` in root directory
- open a browser and go to `https://localhost:8001/` or `http://localhost:8000/`

## Setting up SQLite  
- Install GUI from https://sqlitebrowser.org/dl/
- Generate database file `/data/SQLite.dev.db`
  - If you decide to choose a different name you need to update the connection string in `appsettings.json`
- Run migrations using `dotnet ef database update`

## Changelog format
This project follows the format based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
