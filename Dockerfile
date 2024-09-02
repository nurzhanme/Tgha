FROM mcr.microsoft.com/dotnet/sdk:8.0@sha256:35792ea4ad1db051981f62b313f1be3b46b1f45cadbaa3c288cd0d3056eefb83 as builder
COPY /Tgha /app
RUN dotnet publish -c Release -o /out /app/Tgha.csproj

FROM mcr.microsoft.com/dotnet/runtime:8.0 as base
WORKDIR /app
COPY --from=builder /out .

ENTRYPOINT ["dotnet", "Tgha.dll"]
