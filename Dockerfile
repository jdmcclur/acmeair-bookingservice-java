FROM open-liberty:full-java11-openj9

# Config
COPY --chown=1001:0 src/main/liberty/config/server.xml /config/server.xml
COPY --chown=1001:0 src/main/liberty/config/jvm.options /config/jvm.options
COPY --chown=1001:0 src/main/liberty/config/bootstrap.properties /config/bootstrap.properties

# App
COPY --chown=1001:0 target/acmeair-bookingservice-java-6.1.war /config/apps/

# Logging vars
ENV LOGGING_FORMAT=simple
ENV ACCESS_LOGGING_ENABLED=false
ENV TRACE_SPEC=*=info

# Build SCC?
ARG CREATE_OPENJ9_SCC=true
ENV OPENJ9_SCC=${CREATE_OPENJ9_SCC}

RUN configure.sh
