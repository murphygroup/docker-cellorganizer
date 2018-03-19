#!/bin/bash

# demo3D02
#
# Generate surface plot of image synthesized by demo3D00.
#
# Input
# -----
# * three TIFF files (nuclear, cell shape, and nucleolar channels)
#   from demo3D00 directory
#
# Output
# ------
# * a surface plot of the synthetic image
#
# Created: Robert F. Murphy
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

echo -e
"options.seed = 12345;
try; state = rng( options.seed ); catch err; rand( 'seed', options.seed ); end;
directory = '/home/murphylab/cellorganizer/demos/3D/demo3D00/img/cell1';
if ~exist( directory ); warning(['Directory not found. Exiting program.']); return; end;
try; 
colors = {'blue', 'green' 'red'};
viewangles = [20,-30];    
alphaval = 0.1;
syn2surfaceplot( tiff_directory, colors, viewangles, alphaval );
saveas(gcf,'output.png');
answer = true;
catch;
warning( 'Unable to make surface plot.' );
end;
"