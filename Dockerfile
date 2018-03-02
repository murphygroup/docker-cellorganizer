FROM icaoberg/matlabmcr2017a

###############################################################################################
MAINTAINER Ivan E. Cao-Berg <icaoberg@andrew.cmu.edu>
LABEL Description="CellOrganizer"
LABEL Vendor="Murphy Lab in the Computational Biology Department at Carnegie Mellon University"
LABEL Web="http://murphylab.cbd.cmu.edu"
LABEL Version="2.7.0"
###############################################################################################

###############################################################################################
# INSTALL CELLORGANIZER BINARIES
WORKDIR /home/murphylab
USER root
RUN echo "Downloading CellOrganizer v2.6.0" && \
	cd ~/ && \
	wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/cellorganizer-v2.7.0-binaries.tgz && \
	tar -xvf cellorganizer-v2.7.0-binaries.tgz && \
	rm cellorganizer-v2.7.0-binaries.tgz && \
	mv cellorganizer-binaries /opt
RUN chmod +x /opt/cellorganizer-binaries/img2slml
RUN chmod +x /opt/cellorganizer-binaries/slml2img
RUN ln -s /opt/cellorganizer-binaries/img2slml /usr/local/bin/train
RUN ln -s /opt/cellorganizer-binaries/slml2img /usr/local/bin/synthesize
###############################################################################################

###############################################################################################
USER murphylab
RUN echo "Downloading models" && \
	wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/cellorganizer-v2.7.0-models.tgz && \
	tar -xvf cellorganizer-v2.7.0-models.tgz && \
	rm -f cellorganizer-v2.7.0-models.tgz

RUN echo "Downloading images" && \
	wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/cellorganizer-v2.7.0-images.tgz && \
	tar -xvf cellorganizer-v2.7.0-images.tgz && \
	rm -f cellorganizer-v2.7.0-images.tgz

RUN echo "Downloading demos" && \
	wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/cellorganizer-v2.7.0-demos.tgz && \
	tar -xvf cellorganizer-v2.7.0-demos.tgz && \
	rm -f cellorganizer-v2.7.0-demos.tgz
#RUN find ~/cellorganizer -empty -exec rm -rfv {} \;
RUN find ~/cellorganizer/demos -name "*.sh" -exec chmod +x {} \;
###############################################################################################
