#!/bin/bash

# demo3D11
#
# Train 3D generative model of the cell framework (nucleus and cell shape)
# using the Murphy Lab 3D HeLa TfR dataset.
#
# Input 
# -----
# * a directory of raw or synthetic nucleus images
# * a directory of raw or synthetic cell shape images
# * the resolution of the images (all images should have the same
#   resolution)
#
# Output
# ------
# * a valid SLML model
#
# Created: Ivan E. Cao-Berg
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

wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/demo3D11.tgz

mkdir -p ../../../images/HeLa/3D

tar -xvf demo3D11.tgz -C ../../../images/HeLa/3D/

rm -f demo3D11.tgz

echo -e "options.sampling.method = 'disc';
options.debug = true;
options.verbose = true;
options.display = false;
options.downsampling = [5,5,1];
options.train.flag = 'framework';
options.model.filename = '3D_HeLa_framework.xml';
options.model.name = '3d_hela_framework_model';
options.model.id = num2str(now);
options.nucleus.type = 'cylindrical_surface';
options.nucleus.class = 'nuclear_membrane';
options.nucleus.name = 'all';
options.nucleus.id = num2str(now);
options.cell.type = 'ratio';
options.cell.class = 'cell_membrane';
options.cell.model = 'framework';
options.cell.id = num2str(now);
options.model.resolution = [0.049, 0.049, 0.2000];
imageDirectory = '/home/murphylab/cellorganizer/images/HeLa/3D/processed/';
dimensionality = '3D';
pattern = 'framework';
dnaImagesDirectoryPath = [imageDirectory filesep 'TfR*cell*ch0*.tif'];
cellImagesDirectoryPath = [imageDirectory filesep 'TfR*cell*ch1*.tif'];
proteinImagesDirectoryPath = [];
options.masks = [imageDirectory filesep 'TfR*mask*.tif'];
options.documentation.author = 'Murphy Lab';
options.documentation.email = 'murphy@cmu.edu';
options.documentation.website = 'murphy@cmu.edu';
options.documentation.description = 'This is the framework model is the result from demo3D11.';
options.documentation.date = date;\
" > input.txt

img2slml $(pwd)/input.txt