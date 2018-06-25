#!/bin/bash

# demo3D47
#
# Combine two generative model files into a single file
#
# Input 
# -----
# * a list of valid CellOrganizer model files
#
# Output
# ------
# * a valid model
# 
# Created: Rita Chen
#
# Copyright (C) 2012-2018 Murphy Lab
# Lane Center for Computational Biology 
# School of Computer Science
# Carnegie Mellon University
# 
# This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
#
# For additional information visit http://murphylab.web.cmu.edu or send an email to murphy@cmu.edu.

echo -e "\
disp('demo3D47');
disp('The estimated running time is about 1 minute. Please wait.');
options.output_filename = 'model.mat';
options.selection = [1,1,0;0,0,1];

options.documentation.author = 'Murphy Lab';
options.documentation.email = 'murphy@cmu.edu';
options.documentation.website = 'murphy@cmu.edu';
options.documentation.description = 'This combined model is the result from demo3D47.';
options.documentation.date = date;
file1 = '/home/murphylab/cellorganizer/models/3D/mit.mat';
file2 = '/home/murphylab/cellorganizer/models/3D/nuc.mat';
files = {file1, file2};\
" > input.txt

slml2slml $(pwd)/input.txt
