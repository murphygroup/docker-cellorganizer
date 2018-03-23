#!/bin/bash

# demo3D47
#
# This demo uses slml2model to display information from a valid model file
#
# Input
# ------
# * a CellOrganizer model
#
# Output
# ------
# * a report
#
# Created: Ivan E. Cao-Berg
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

echo -e "\
disp( 'demo3D47' );
disp( 'The estimated running time is 1 minute. Please wait.' );
directory = '/home/murphylab/cellorganizer/models/3D/diffeomorphic/';
instance = [directory 'helamodel_9_16_15.mat'];
" > input.txt

slml2info $(pwd)/input.txt
