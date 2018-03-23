FROM icaoberg/matlabmcr2017a

###############################################################################################
MAINTAINER Ivan E. Cao-Berg <icaoberg@andrew.cmu.edu>
LABEL Description="CellOrganizer"
LABEL Vendor="Murphy Lab in the Computational Biology Department at Carnegie Mellon University"
LABEL Web="http://murphylab.cbd.cmu.edu"
LABEL Version="2.7.1"
###############################################################################################

###############################################################################################
# INSTALL CELLORGANIZER BINARIES
WORKDIR /home/murphylab
USER root
RUN echo "Downloading CellOrganizer v2.7.1" && \
	cd ~/ && \
	wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/cellorganizer-v2.7.1-binaries.tgz && \
	tar -xvf cellorganizer-v2.7.1-binaries.tgz && \
	rm cellorganizer-v2.7.1-binaries.tgz && \
	mv cellorganizer-binaries /opt
RUN chmod +x /opt/cellorganizer-binaries/img2slml
RUN chmod +x /opt/cellorganizer-binaries/slml2img
RUN ln -s /opt/cellorganizer-binaries/img2slml /usr/local/bin/img2slml
RUN ln -s /opt/cellorganizer-binaries/slml2img /usr/local/bin/slml2img
###############################################################################################

###############################################################################################
USER murphylab
RUN echo "Downloading models" && \
	wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/cellorganizer-v2.7.1-models.tgz && \
	tar -xvf cellorganizer-v2.7.1-models.tgz && \
	rm -f cellorganizer-v2.7.1-models.tgz

RUN echo "Downloading images" && \
	wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/cellorganizer-v2.7.1-images.tgz && \
	tar -xvf cellorganizer-v2.7.1-images.tgz && \
	rm -f cellorganizer-v2.7.1-images.tgz

COPY demos cellorganizer/demos

RUN find ~/cellorganizer -empty -exec rm -rfv {} \;

USER root
RUN find /home/murphylab/cellorganizer/demos -name "*.sh" -exec chmod +x {} \;
USER murphylab
###############################################################################################
