#!/bin/bash

# demo2D02
#
# Synthesize one 2D image with nuclear, cell shape, and lysosomal channels
# from LAMP2 model trained in demo2D01 without convolution.
#
# Input 
# ------
# * a valid CellOrganizer model file
#
# Output
# ------
# * one TIFF file with three slices (nuclear, cell shape, and lysosomal
#   channels)
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

echo -e "options.numberOfSynthesizedImages = 1;
options.targetDirectory = pwd;
options.prefix = 'img';
options.compression = 'lzw';
options.debug = false;
options.verbose = true;
options.display = false;
filenames = {'/home/murphylab/cellorganizer/demos/2D/demo2D01/lamp2.mat'};
" > input.txt

if [ -f /home/murphylab/cellorganizer/demos/2D/demo2D01/lamp2.mat ]; then
	slml2img $(pwd)/input.txt
fi

if [ -f $(pwd)/img/cell1/cell1.tif ]; then
	file -f $(pwd)/img/cell1/cell1.tif
fi