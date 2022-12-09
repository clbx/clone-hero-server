
FROM --platform=amd64 debian:bullseye-slim
ARG VERSION
RUN apt update && apt install -y wget zip
RUN wget https://pubdl.clonehero.net/chserver/ChStandaloneServer-${VERSION}.zip
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
RUN unzip ChStandaloneServer-${VERSION}.zip
RUN mkdir /app
RUN mv /ChStandaloneServer-${VERSION}/linux-x64/Server /app/Server
WORKDIR /app
RUN chmod +x Server
COPY clonehero.sh .
RUN chmod +x clonehero.sh
CMD ["./clonehero.sh"]