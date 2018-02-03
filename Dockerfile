FROM docker pull icaoberg/matlabmcr2017a

MAINTAINER Ivan E. Cao-Berg <icaoberg@andrew.cmu.edu>
LABEL Description="CellOrganizer."
LABEL Vendor="Murphy Lab in the Computational Biology Department at Carnegie Mellon University"
LABEL Web="http://murphylab.cbd.cmu.edu"
LABEL Version="2.7.0"

USER murphylab
WORKDIR /home/murphylab

RUN echo "Downloading CellOrganizer v2.6.0" && \
	cd ~/ && \
	wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/cellorganizer-v2.7.0-binaries.tgz && \
	tar -xvf cellorganizer-v2.7.0-binaries.tgz && \
	rm cellorganizer-v2.7.0-binaries.tgz

RUN echo "Downloading models" && cd ~/cellorganizer && wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/models.tgz && tar -xvf models.tgz && rm models.tgz

RUN echo "Downloading images" && cd ~/cellorganizer && wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/images.tgz && tar -xvf images.tgz && rm images.tgz

RUN echo "Downloading tools" && cd ~/cellorganizer && wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/tools.tgz && tar tools.tgz && rm tools.tgz

RUN find . -type f -name "mccExcludedFiles.log" -exec rm -fv {} \;
RUN find . -type f -name "*.m" -exec rm -fv {} \;
RUN find . -type f -name "requiredMCRProducts.txt" -exec rm -fv {} \;
RUN find . -type f -name "readme.txt" -exec rm -fv {} \;
RUN find . -type f -name "run*.sh" -exec rm -fv {} \;
RUN tree ./cellorganizer
