FROM matrixdotorg/synapse:v1.16.1-py3 as builder
RUN apk add git
RUN pip install --prefix="/install" --no-warn-script-location git+https://github.com/matrix-org/synapse-s3-storage-provider.git

FROM matrixdotorg/synapse:v1.16.1-py3
COPY --from=builder /install /usr/local
