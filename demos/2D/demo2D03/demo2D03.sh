#!/bin/bash

# demo2D03
#
# Train 2D generative model of the nucleus, cell shape, and lysosome using
# all LAMP2 images in the Murphy Lab 2D HeLa dataset.
#
# Input 
# -----
# * a directory of raw or synthetic nucleus images
# * a directory of raw or synthetic cell shape images
# * a directory of raw or synthetic lysosome images
# * the resolution of the images (all images should have the same resolution)
#
# Output
# ------
# * a valid SLML model file
#
# Author: Ivan E. Cao-Berg (icaoberg@scs.cmu.edu)
#
# Copyright (C) 2013-2018 Murphy Lab
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

wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/demo2D03.tgz

mkdir -p ../../../images/HeLa/2D

tar -xvf demo2D03.tgz -C ../../../images/HeLa/2D/

rm -f demo2D03.tgz

echo -e "options.verbose = true;
options.debug = true;
options.display = true;
options.model.name = 'demo2D03';
options.train.flag = 'all';
options.nucleus.class = 'nuclear_membrane';
options.nucleus.type = 'medial_axis';
options.cell.class = 'cell_membrane';
options.cell.type = 'ratio';
options.protein.class = 'vesicle';
options.protein.type = 'gmm';
directory = '/home/murphylab/cellorganizer/images/HeLa/2D/LAM/';
dimensionality = '2D';
dnaImagesDirectoryPath = [ directory filesep 'orgdna' filesep '*.tif' ];
cellImagesDirectoryPath = [ directory filesep 'orgcell' filesep '*.tif' ];
proteinImagesDirectoryPath = [ directory filesep 'orgprot' filesep '*.tif' ];
options.masks = [ directory filesep 'crop' filesep '*.tif' ];
options.model.resolution = [ 0.49, 0.49 ];
options.model.filename = 'lamp2.xml';
options.model.id = 'lamp2';
options.documentation.description = 'This model has been trained using demo2D033 from CellOrganizer';
" > input.txt

img2slml $(pwd)/input.txt