#!/bin/bash

# demo2D00
# 
# Synthesize one 2D image with nuclear, cell shape, and vesicular channels
# from all vesicular object models (nucleoli, lysosomes, endosomes, and
# mitochondria) without convolution. The model was trained from the Murphy
# Lab 2D HeLa dataset.
# 
# Input
# ------
# * List of valid CellOrganizer model files
# 
# Output
# ------
# * one TIFF file with six slices (nuclear, cell shape, nucleolar, lysosomal, 
# endosomal, and mitochondrial channels)
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

wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/demo2D00.tgz

mkdir -p ../../../images/HeLa/2D

tar -xvf demo2D00.tgz -C ../../../images/HeLa/2D/

rm -f demo2D00.tgz

echo -e "filenames={'/home/murphylab/cellorganizer/models/2D/nucleolus.mat', '/home/murphylab/cellorganizer/models/2D/lysosome.mat', '/home/murphylab/cellorganizer/models/2D/endosome.mat', '/home/murphylab/cellorganizer/models/2D/mitochondrion.mat' };
options.targetDirectory = pwd;
options.prefix = 'img';
options.compression = 'lzw';
options.debug = false;
options.verbose = true;
options.display = false;
options.numberOfSynthesizedImages = 1;
" > input.txt

#slml2img $(pwd)/input.txt

#file img/cell1/cell1.tiff