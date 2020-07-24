version 1.0
workflow bamtofasta {
  input {
  }
  File bamInput = "/fh/scratch/delete90/paguirigan_a/svelazqu/stagedInputs/countOCItrial1/outs/possorted_genome_bam.bam"
  String olgaBotInaContainer = "vortexing/bam2fasta:1.0.4"

  call makeSCbams {
    input:
      sampleBam = bamInput,
      sampleName = "OCI-AML3",
      threads = 16,
      taskDocker = olgaBotInaContainer
  }
  output {
    File barcodeMetadata = makeSCbams.barcodeMetadata
  }
}

task makeSCbams {
  input {
    File sampleBam
    String sampleName
    Int threads
    String taskDocker
  }
  command {
    set -eo pipefail
    bam2fasta convert --filename ~{sampleBam} \
      --min-umi-per-barcode 10 \
      --write-barcode-meta-csv ~{sampleName}.all_barcodes_meta.csv \
      --processes ~{threads-1} 
  }
  output {
    File barcodeMetadata = "~{sampleName}.all_barcodes_meta.csv"
  }
  runtime {
    cpu: threads
    memory: "16GB"
    docker: taskDocker
  }
}