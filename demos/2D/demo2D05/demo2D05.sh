#!/bin/bash

# demo2D05
#
# Train 2D generative pca nuclear and cell shape model using the Murphy Lab 2D HeLa dataset.
# Input
# -----
# * a directory of raw or synthetic nucleus images
# * a directory of raw or synthetic cell shape images
# * the resolution of the images (all images should have the same resolution)
#
# Output
# ------
# * a valid SLML model file

# Author: Xiongtao Ruan (xruan@andrew.cmu.edu)
# 
# Copyright (C) 2018 Murphy Lab
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

directory=../../../images/HeLa/2D/LAM

if [ ! -d "$directory" ]; then

	wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/demo2D05.tgz

	mkdir -p ../../../images/HeLa/2D/LAM

	tar -xvf demo2D05.tgz -C ../../../images/HeLa/2D/LAM/

	rm -f demo2D05.tgz

fi

echo -e "options.verbose = true;
options.debug = false;
options.display = false;
options.model.name = 'demo2D05';
options.train.flag = 'framework';
options.nucleus.class = 'framework';
options.nucleus.type = 'pca';
options.cell.class = 'framework';
options.cell.type = 'pca';
options.latent_dim = 15;
directory = '/home/murphylab/cellorganizer/images/HeLa/2D/LAM';
dnaImagesDirectoryPath = [ directory filesep 'orgdna' filesep 'cell*.tif' ];
cellImagesDirectoryPath = [ directory filesep 'orgcell' filesep 'cell*.tif' ];
proteinImagesDirectoryPath = [];
options.masks = [ directory filesep 'crop' filesep 'cell*.tif' ];
options.model.resolution = [ 0.49, 0.49 ];
options.model.filename = 'lamp2.xml';
options.model.id = 'lamp2';
options.model.name = 'lamp2';
options.nucleus.name = 'LAMP2';
options.cell.model = 'LAMP2';
dimensionality = '2D';
options.documentation.description = 'This model has been trained using demo2D05 from CellOrganizer';
options.train.flag = 'framework';\
" > input.txt

img2slml $(pwd)/input.txt
