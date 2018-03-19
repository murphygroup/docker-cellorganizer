#!/bin/bash

# demo3D20
#
# Train 3D generative diffeomorphic model of the cell framework (nucleus
# and cell shape) using 10 images Murphy Lab 3D HeLa LAMP2 dataset.
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
# -------
# * a valid SLML model file
# * a visualization of the shape space

# Created: Gregory Johnson
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

wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/demo3D20.tgz

mkdir -p ../../../images/HeLa/3D

tar -xvf demo3D20.tgz -C ../../../images/HeLa/3D/

rm -f demo3D20.tgz

echo -e "dimensionality = '3D';
options.verbose = true;
options.debug = true;
options.train.flag = 'framework';
options.model.name = 'demo3D20';
options.model.id = num2str(now);
options.model.filename = 'model.xml' ;
options.nucleus.type = 'diffeomorphic';
options.nucleus.class = 'framework';
options.nucleus.id = num2str(now);
options.nucleus.name = 'lamp2';
options.cell.type = 'diffeomorphic';
options.cell.class = 'framework';
options.cell.model = 'lamp2';
options.cell.id = num2str(now);
directory = '/home/murphylab/cellorganizer/images/HeLa/3D/processed';
dnaImagesDirectoryPath = {[directory filesep 'LAM_cell1_ch0_t1.tif'],[directory filesep 'LAM_cell2_ch0_t1.tif'], [directory filesep 'LAM_cell3_ch0_t1.tif'], [directory filesep 'LAM_cell4_ch0_t1.tif'], [directory filesep 'LAM_cell5_ch0_t1.tif'], [directory filesep 'LAM_cell6_ch0_t1.tif'], [directory filesep 'LAM_cell7_ch0_t1.tif'], [directory filesep 'LAM_cell8_ch0_t1.tif'], [directory filesep 'LAM_cell9_ch0_t1.tif']};
cellImagesDirectoryPath = {[directory filesep 'LAM_cell1_ch1_t1.tif'], [directory filesep 'LAM_cell2_ch1_t1.tif'], [directory filesep 'LAM_cell3_ch1_t1.tif'], [directory filesep 'LAM_cell4_ch1_t1.tif'], [directory filesep 'LAM_cell5_ch1_t1.tif'], [directory filesep 'LAM_cell6_ch1_t1.tif'], [directory filesep 'LAM_cell7_ch1_t1.tif'], [directory filesep 'LAM_cell8_ch1_t1.tif'], [directory filesep 'LAM_cell9_ch1_t1.tif']};
proteinImagesDirectoryPath = [];
options.masks = {[directory filesep 'LAM_cell1_mask_t1.tif'], [directory filesep 'LAM_cell2_mask_t1.tif'], [directory filesep 'LAM_cell3_mask_t1.tif'], [directory filesep 'LAM_cell4_mask_t1.tif'], [directory filesep 'LAM_cell5_mask_t1.tif'], [directory filesep 'LAM_cell6_mask_t1.tif'], [directory filesep 'LAM_cell7_mask_t1.tif'], [directory filesep 'LAM_cell8_mask_t1.tif'], [directory filesep 'LAM_cell9_mask_t1.tif']};
options.model.resolution = [0.049, 0.049, 0.2000];
options.downsampling = [10,10,1];
" > input.txt

img2slml $(pwd)/input.txt