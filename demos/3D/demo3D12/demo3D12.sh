#!/bin/bash

# demo3D12
#
# Train 3D generative model of the nucleus, cell shape, and lysosome using
# 30 LAMP2 images in the Murphy Lab 3D HeLa dataset.
#
# Input 
# -----
# * a directory of raw or synthetic nucleus images
# * a directory of raw or synthetic cell shape images
# * a directory of raw or synthetic lysosome images
# * the resolution of the images (all images should have the same
#   resolution)
#
# Output
# ------
# * a valid SLML model file

# Created: Ivan E. Cao-Berg
#
# Copyright (C) 2012-2018 Murphy Lab
# Lane Center for Computational Biology
# School of Computer Science
# Carnegie Mellon University
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published
# by the Free Software Foundation; either version 2 of the License,
# or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
# 02110-1301, USA.
#
# For additional information visit http://murphylab.web.cmu.edu or
# send email to murphy@cmu.edu

directory=../../../images/HeLa/3D/processed

if [ ! -d "$directory" ]; then
	wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/v2.7.1/images/demo3D12.tgz
	mkdir -p ../../../images/HeLa/3D/processed
	tar -xvf demo3D12.tgz -C ../../../images/HeLa/3D/processed/
	rm -f demo3D12.tgz
fi

echo -e "pattern = 'LAMP2';
dimensionality = '3D';
options.protein.class = 'lysosome';
options.protein.name = 'lamp2';
options.nucleus.name = 'lamp2';
options.cell.model = 'lamp2';
options.model.name = 'all';
options.model.id = num2str(now);
options.nucleus.type = 'cylindrical_surface';
options.nucleus.class = 'nuclear_membrane';
options.nucleus.id = num2str(now);
options.cell.type = 'ratio';
options.cell.id = num2str(now);
options.cell.class = 'cell_membrane';
options.protein.type = 'gmm';
options.protein.class = 'vesicle';
options.protein.id = num2str(now);
if strcmpi( options.protein.class, 'nuc' ) options.protein.cytonuclearflag = 'nuc'; else options.protein.cytonuclearflag = 'cyto'; end
options.verbose = true;
options.debug = false;
options.documentation.description='This model has been trained using demo3D12 from CellOrganizer';
directory = '/home/murphylab/cellorganizer/images/HeLa/3D/processed';
dnaImagesDirectoryPath = [directory filesep 'LAM*cell[1-30]*ch0*.tif'];
cellImagesDirectoryPath = [directory filesep 'LAM*cell[1-30]*ch1*.tif'];
proteinImagesDirectoryPath = [directory filesep 'LAM*cell[1-30]*ch2*.tif'];
options.masks = [directory filesep 'LAM*cell[1-30]*mask*.tif'];
options.train.flag = 'all';
options.model.resolution=[0.049, 0.049, 0.2000];
options.model.filename = 'LAMP2.xml';" > input.txt

img2slml $(pwd)/input.txt

if [ ! -f $(pwd)/LAMP2.mat ]; then
	echo "File "$(pwd)"/LAMP2.mat does not exist"
	exit -1
fi
