FROM matrixdotorg/synapse:v1.46.0 as builder
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
RUN pip install --prefix="/install" --no-warn-script-location git+https://github.com/matrix-org/synapse-s3-storage-provider.git

FROM matrixdotorg/synapse:v1.46.0
COPY --from=builder /install /usr/local
