FROM mcr.microsoft.com/dotnet/sdk:8.0 as builder
COPY /Tgha /app
RUN dotnet publish -c Release -o /out /app/Tgha.csproj

FROM mcr.microsoft.com/dotnet/runtime:8.0 as base
WORKDIR /app
COPY --from=builder /out .

ENTRYPOINT ["dotnet", "Tgha.dll"]