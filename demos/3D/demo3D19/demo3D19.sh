#!/bin/bash

# demo3D19
#
# This demo uses slml2report to compare the parameters between a pair
# of CellOrganizer models and returns a folder containing a .html report
# together with the accompanying .png images.
#
# Input 
# -----
# * a pair of valid CellOrganizer models
#
# Output
# ------
# * 10 .png images
# * 1 .html report
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

DIRECTORY'/home/murphylab/cellorganizer/models/3D/';
FILE1=$DIRECTORY"/nuc.mat"
FILE2=$DIRECTORY"/lamp2.mat"

slml2report $FILE1 $FILE2
