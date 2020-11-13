## Step 1. Generating indexes of the genome we want to align to.

STAR \
--runMode genomeGenerate \
--genomeDir star_index \
--genomeFastaFiles genome/* \
--sjdbGTFfile annotation/* \
--runThreadN 4

## star_index will be the folder we will keep the indexes files to run STAR
## --genomeFastaFiles specify the fasta files of reference genome
## --sjdbOverhang 1 to prohibit splicing over annotated junctions in the GTF

## Step 2. Mapping reads

params='  --runThreadN 2
          --sjdbGTFfile annotation/*
          --alignEndsType Local
          --outFilterMismatchNmax 1
          --outFilterMultimapScoreRange 0
          --quantMode TranscriptomeSAM GeneCounts
          --outReadsUnmapped Fastx
          --outSAMtype BAM SortedByCoordinate
          --outFilterMultimapNmax 10
          --outSAMunmapped Within
          --outFilterScoreMinOverLread 0
          --outFilterMatchNminOverLread 0
          --outFilterMatchNmin 16
          --alignSJDBoverhangMin 1000
          --alignIntronMax 1
          --outWigType wiggle
          --outWigStrand Stranded
          --outWigNorm RPM
        '

STAR \
--genomeDir star_index \
--readFilesIn $sn'_cutadapt.fastq.gz' \
--readFilesCommand zcat \
$params \
--outFileNamePrefix snxx

