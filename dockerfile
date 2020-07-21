FROM ubuntu:18.04
RUN apt-get update -y
RUN apt-get install -y python python-pip libbz2-dev libcurl4-openssl-dev libssl-dev zlib1g-dev liblzma-dev
RUN pip install bam2fasta