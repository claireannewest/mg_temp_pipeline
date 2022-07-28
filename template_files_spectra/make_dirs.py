import os
import numpy as np
from shutil import copyfile

#######################################################################################

intermsof = 'um' # Either 'eV' or 'um' (pick which unit the name of folders to be in.)
start = 0.400 	 # Starting wavelength or energy of spectrum 
finish = 1.000	 # Highest wavelength or energy of spectrum (must be > start)
num = 151      	 # Number of wavelengths / energy points in spectrum

#######################################################################################

def make_directories(intermsof, start, finish, num):
        points = np.linspace(start, finish, num)
        for i in points:
                if intermsof == 'eV':
                        name = str("%.3f" % i) + str('_eV')
                        new_wavelength = np.round(1.240/i,4)
                if intermsof == 'um':
                        name = str("%.3f" % i) + str('_um')
                        new_wavelength = np.round(i,4)                                                     
                os.mkdir(name)
                copyfile('ddscat.par', str(name)+str('/ddscat.par'))
                new_ddscatpar = open(str(name)+str('/ddscat.par'))
                lines = new_ddscatpar.readlines()
                new_string = str(' ') + str("%.4f" % new_wavelength) + str(' ') + str("%.4f" % new_wavelength) + str(" 1 'INV' = wavelengths (first,last,how many,how=LIN,INV,LOG)" + '\n')
                lines[26] = new_string
                new_ddscatpar = open(str(name)+str('/ddscat.par'), "w")
                new_ddscatpar.writelines(lines)
                new_ddscatpar.close()
                os.symlink(str(os.getcwd())+str('/shape.dat'), str(name) + str('/shape.dat'))

def make_submissionscripts(intermsof, start, finish, num):
        points = np.linspace(start, finish, num)
        folders = []
        for i in points:
                if intermsof == 'eV':
                        name = str("%.3f" % i) + str('_eV')
                if intermsof == 'um':
                        name = str("%.3f" % i) + str('_um')
                folders = np.append(folders, name)
        j=0
        copyfile('launch_temp.slurm', str('launch.slurm'))
        new_launch = open(str('launch.slurm'))
        lines = new_launch.readlines()
        thepoints = folders
        new_string = str('array=( ')+' '.join(repr(i) for i in thepoints).replace("'", '"') + str(' )') + str('\n')
        lines[25] = new_string
        lines[21] = str('#SBATCH --array=0-')+str(num-1)
        new_launch = open(str('launch.slurm'),"w")
        new_launch.writelines(lines)
        new_launch.close()

        file = open(str('collect_cross_secs.sh'),'w')
        file.write(str('#!/bin/bash') + '\n')
        file.write(str('# Collect all the files and write it to a file named Spectrum') + '\n')
        if intermsof == 'eV':
        	file.write(str('for i in *eV ;do') + '\n')
        if intermsof == 'um':
        	file.write(str('for i in *um ;do') + '\n')
        file.write('\t' + str('cd $i; cp qtable temp') + '\n')
        file.write('\t' + str('sed -i -e "1,14d" temp') + '\n')
        file.write('\t' + str('cat temp >>../Spectrum') + '\n')
        file.write('\t' + str('rm temp') + '\n')
        file.write('\t' + str('rm shape.dat') + '\n')
        file.write('\t' + str('rm Einc_w000_ddscat.par') + '\n')
        file.write('\t' + str('cd ../') + '\n')
        file.write(str('done') + '\n')

make_directories(intermsof=intermsof, start=start, finish=finish, num=num)
make_submissionscripts(intermsof=intermsof, start=start, finish=finish, num=num)
