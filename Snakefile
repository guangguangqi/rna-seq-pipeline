configfile: "config.yaml"

SAMPLES = config["samples"]

rule all:
    input:
        expand("results/qc/{sample}_fastqc.html", sample=SAMPLES),
        expand("results/aligned/{sample}Aligned.sortedByCoord.out.bam", sample=SAMPLES)

# Include your separated workflow files
include: "workflow/rules/qc.smk"
include: "workflow/rules/align.smk"
