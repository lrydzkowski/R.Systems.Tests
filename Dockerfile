FROM mcr.microsoft.com/dotnet/runtime:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

COPY ["./R.Systems.Tests/.", "R.Systems.Tests/"]
WORKDIR "/src/R.Systems.Tests"
RUN dotnet restore "R.Systems.Tests.csproj"
RUN dotnet build "R.Systems.Tests.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "R.Systems.Tests.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "R.Systems.Tests.dll"]