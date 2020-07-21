FROM ubuntu:18.04
RUN apt-get update -y
RUN apt-get install -y python python-pip
RUN apt-get install -y libbz2-dev libcurl4-openssl-dev libssl-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y liblzma-dev
RUN pip install bam2fasta
RUN bam2fasta info -v
