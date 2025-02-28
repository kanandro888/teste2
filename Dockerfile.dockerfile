# Use a imagem oficial do .NET 6 SDK como base para build
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Defina o diretório de trabalho
WORKDIR /app

# Copie o arquivo .csproj e restaure as dependências
COPY *.csproj .
RUN dotnet restore

# Copie todo o código para dentro do container
COPY . .

# Faça o build da aplicação
RUN dotnet publish -c Release -o out

# Use a imagem do .NET 6 Runtime para rodar a aplicação
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime

# Defina o diretório de trabalho
WORKDIR /app

# Copie o binário gerado na fase anterior para o container
COPY --from=build /app/out .

# Defina o comando para rodar a aplicação
ENTRYPOINT ["dotnet", "HelloWorldAPI.dll"]
