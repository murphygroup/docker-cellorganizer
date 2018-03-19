#!/bin/bash

# demo2D04
#
# Train 2D generative diffeomorphic nuclear and cell shape model and a
# lysosomal model using 10 LAMP2 images in the Murphy Lab 2D HeLa dataset.
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
# Author: Xiongtao Ruan (xruan@andrew.cmu.edu)
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

echo -e "options.verbose = true;
options.debug = false;
options.display = false;
options.model.name = 'demo2D04';
options.train.flag = 'framework';
options.nucleus.class = 'framework';
options.nucleus.type = 'diffeomorphic';
options.cell.class = 'framework';
options.cell.type = 'diffeomorphic';
options.protein.class = 'vesicle';
options.protein.type = 'gmm';
options.model.diffeomorphic.distance_computing_method = 'faster';
directory = '/home/murphylab/cellorganizer/images/HeLa/2D/LAM/';
dnaImagesDirectoryPath = [ directory filesep 'orgdna' filesep 'cell[0-9].tif' ];
cellImagesDirectoryPath = [ directory filesep 'orgcell' filesep 'cell[0-9].tif' ];
proteinImagesDirectoryPath = [ directory filesep 'orgprot' filesep 'cell[0-9].tif' ];
options.masks = [ directory filesep 'crop' filesep 'cell[0-9].tif' ];
options.model.resolution = [ 0.49, 0.49 ];
options.model.filename = 'lamp2.xml';
options.model.id = 'lamp2';
options.model.name = 'lamp2';
options.nucleus.name = 'LAMP2';
options.cell.model = 'LAMP2';
dimensionality = '2D';
options.documentation.description = 'This model has been trained using demo2D04 from CellOrganizer';
options.downsampling = [5,5];
options.model.diffeomorphic.com_align = 'nuc';\
" > input.txt

img2slml $(pwd)/input.txt
