# Pipeline for Calculating Temperatures of Magnesium Nanoparticles

## Stage A: Make the Shapes using Crystal Creator
1. Create a folder (outside of this repo) called `shape_files_from_cc`. (You'll likely want a more descriptive name, or to put this in another folder with a more descriptive name, but this can be done later.)
2. Open the file `GrowthDDSCAT.m` in MATLAB. Make sure the path indicated next to the little blue folder directs to the folder you just created. This can be changed by clicking the dropdown buttons. This path is where your `shape.dat` files will be saved. 
3. Press the Run button. You may get an error message that the file is not found in the current path. To resolve this, simply click the Add to Path button. This will open up a GUI figure. Make this full screen, as this is the window you'll be working in.
4. To model Mg NPs, select the Crystal Type: Hexagonal. For the conventional shapes, you will not have to change the listed default Energy / growth velocity values.
5. For Single Crystal, Twin 1011, Twin 1012, and Twin 1013, set Calculation Step to 0.2, and leave the remaining three parameters in the green box as the default values. For Twin 1121, return to the blue box, and set Twin enhancment to 1.1, and in the green box Calculation step 0.2 and Calculation boundaries 30.
6. The red box sets which twinned or single crystal shape you'd like to run. The orange box sets the Shell thickness. (Note this is a starting value for the calculation, you'll need to check later that this is the actual value that is produced.)
7. You're just about ready to run the calculation! Before you do, record all of the values from the blue, green, red, and orange boxes. If you begin to change from the above recommendations, you'll want to make sure you remember what values you used. 
7. You are now ready to run the calculation! 
* Click Create Figure. Once the figure appears, click the Rotate 3D button in the upper right. The button should turn blue and your curser should look like a the icon. Then right-click on the figure, and select Go to X-Y view.
* Click calculate effective radius. Follow the instructions in the window that pops up. Note that due to how the calculation is performed, you may need to add a few extra nm to the value you input to get the desired value. E.g., if you'd like a tip-to-tip distance of 200 nm you may need to set the distance in the box to 205. You'll have to play around with this a bit until you find the correct value. When you select your two points, make sure you develop a procedure for finding those same points the next time you make a shape (e.g., picking the min / max / zero values for each coordinate).
* Click Define interdipole distance. This is your dipole spacing value.
* If running a calculation with a shell, click Create shell.
* Lastly, click Create DDSCAT shape file. Change the name to `shape-<something memorable>`. E.g., `shape-hex200`. This will save your shape file.

## Stage B: Check Dimensions of Shape File
Before moving forward, you'll need to double check that the shape you created is the one you wanted.
1. Open the Jupyter Notebook file, `Plot CC Shapes with Shell` (or `Plot CC Shapes` if you did not use a shell).
2. Use the first cell for your single crystal hexagons, and the second cell for the twinned structures. Note that this and the following scripts are only optimized for the Crystal Type: Hexagonal.
3. Make sure the first line in each cell directs to where you've saved your shape file.
4. Make sure the second line in each cell is the dipole spacing you specified with Define interdipole distance.
5. You should now be able to run the code. It should produce a cross-sectional view of the shape and print the shape's thickness, length, and width. I've also differentiated these values according to display the metal's dimensions, and the shell dimensions.
6. For the twinned structures, calculating these values is slightly more complicated. Before recording the printed values, make sure the magenta dots are on the same side, i.e., measuring the thickness accurately. Depending on the shape you've created, sometime the pink dots may appear on opposite, diagonal sides and the printed values will not be correct. This is a quick fix if this happens, follow up and I can answer questions.
7. Now, make sure the dimensions are what you wanted them to be. If not, you'll need to remake the shape in Crystal Creator and perhaps adjust the distance you selected between the points. If the dimensions are all correct, record them in your data file and proceed to the next stage.

## Stage C: Make Spectra Template Folders
The next step is preparing your simulation files to run DDA. This is automated in the Jupyter Notebook `Make Spectra Template Folders` which calls the python script in `make_mg_template_files.py`. Note that these files can accomodate for the production of many template folders if you have multiple different shapes you'd like to calculate at the same time.
1. Create a folder `spectra` outside of this repo. (As with your `shape_files_from_cc` folder, you'll likely want a better name / a better way to organize this, but for learning purposes this will suffice.)
2. Open the file `Make Spectra Template Folders`.
3. Edit the first five lines of the second cell according to your shape file and desired calculation.
* `kind` must read exactly ['hex'] if your shape is the single crystal. This is so that the python code can recognize that that shape needs to be rotated differently compared to the others. Put a seperate entry for each shape file you'd like to run a simulation on. 
* `lat_space` is the dipole spacing
* `ylength` is only used for naming, so this doesn't have to be exact, just recognizable to you.
* `cluster` is which computer you'd like to run the simulation on, either `esc` or `hpc`.
* `shell` is True if you have a shell in your shape file, and False if not.
* `CRSid` is for location of files on the cluster. 
4. Make sure `dirname` path is to your new folder, and make sure the line that starts with mgshape.rewrite_shapefile() has the correct path to your shape file, including the correct name of your shape file.
5. You should be ready to run the code now. Note that if you run the notebook and it doesn't fully complete (e.g., because of an error message), before running the code again, you'll need to go into '../spectra' and delete all the folders that were created in there. Otherwise, you'll get an error message, e.g. "File exists '../spectra/hex' "
6. Go into '../spectra' and make sure all your folders and files were copied correctly.

## Stage D: Run the Optical Calculation
The next stages will depend on wheter you're running the calculation on esc or hpc. For esc:
1. Copy `../spectra/*` folders to the cluster. Then, go into each folder within spectra and perform the following steps:
* In command line, load in python libraries by typing `module load anaconda3`. No error message should appear.
* Then, create all your folders for each wavelength of the calculation by typing `python make_dirs.py`. This should make many folders in your current directory. It should also make a few submission scripts of the form `launch_temp#.slurm`.
* To submit all the calculations at once, type `sbatch submit_together.slurm`.
* You can monitor the progress of your calculation using `squeue -u <your CRSid>`
* If everything ran correctly, `collect.slurm` also should have run and produced the file `Spectrum`. But this is finicky. If you don't see the file `Spectrum`, simply run `sbatch collect.slurm`. Once this finishes, you should have the file `Spectrum.
* Copy all of these folder back to your local computer.

## Stage E: Interpret Optical Calculation, Prepare for Thermal Calculation





