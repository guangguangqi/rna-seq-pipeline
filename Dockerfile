FROM mambaorg/micromamba:latest

USER root

COPY environment.yaml /tmp/environment.yaml

RUN micromamba create \
    -y \
    -n rnaseq \
    -f /tmp/environment.yaml && \
    micromamba clean --all --yes

WORKDIR /workflow

COPY . .

ENTRYPOINT ["/opt/conda/envs/rnaseq/bin/snakemake"]

