# Pipeline for Calculating Temperatures of Magnesium Nanoparticles

## Stage A: Make the Shapes using Crystal Creator

1. Create a folder (directly outside of this repo) called `create_files`. This will be the directory where you store all your prepared files pre-simulation. For the purposes of this demo, create a file within `create_files` called `demo`. All your template files for this demo will be stored there. Finally, create a file within `demo` called `shapes_from_cc`. This is where all shape files from Crystal Creator will be stored. 

2. Open the file `GrowthDDSCAT.m`. This is Crystal Creator. Make sure the path indicated next to the little blue folder directs to the folder you just created. This can be changed by clicking the dropdown buttons. This path is where your shape files will be saved. 

3. Press the Run button. You may get an error message that the file is not found in the current path. To resolve this, simply click the `Add to Path` button. This will open up a GUI figure. Make this full screen, as this is the window you'll be working in.

4. To model Mg NPs, select the `Crystal Type:` `Hexagonal` from the drop-down. For the conventional shapes, you will not have to change the listed default `Energy / growth velocity` values.

5. For `Single Crystal`, `Twin 1011`, `Twin 1012`, and `Twin 1013`, set `Calculation Step` to `0.2`, and leave the remaining three parameters in the green box as the default values. For `Twin 1121`, return to the blue box, and set `Twin enhancment` to `1.1`, and in the green box `Calculation step` `0.2` and `Calculation boundaries` `30`.

6. The red box sets which twinned or single crystal shape you'd like to run. The orange box sets the Shell thickness.

7. Before running the calculation, record all of the values from the blue, green, red, and orange boxes in a text file.

8. You are now ready to run the calculation! 
* Click `Create Figure`. Once the figure appears, click the `Rotate 3D` button in the upper right. The button should turn blue and your curser should look like the icon. Then right-click on the figure, and select `Go to X-Y view`.
* Click `Calculate effective radius`. Follow the instructions in the window that pops up. Note that due to how the calculation is performed, you may need to add a few extra nm to the value you input to get the desired value. E.g., if you'd like a tip-to-tip distance of 200 nm you may need to set the distance in the box to 205. You'll have to play around with this a bit until you find the correct value. When you select your two points, make sure you develop a procedure for finding those same points the next time you make a shape (e.g., picking the min / max / zero values for each coordinate).
* Click `Define interdipole distance`. This is your dipole spacing value.
* If running a calculation with a shell, click `Create shell` and set the value to your desired approximate value. Similar to the size of the shape, this won't necessarily be the exact value you input. 
* Lastly, click `Create DDSCAT shape file`. Change the name to `shape-<something memorable>`. E.g., `shape-hex100nm-4nm` to indicate a 100 nm length hexagonal platelet with a 4 nm shell. This will save your shape file in the working directory. 

9. In order to follow along with the rest of this tutorial, make two shape files, a single crystal hexagonal platelet of 100 nm tip to tip along the longest axis with an 4 nm shell, and a kite (1121 twinned structure) of 80 nm tip to tip and a 6 nm shell, all with a dipole spacing of 2.




## Stage B: Check Dimensions of Shape File
Before moving forward, you'll need to double check that the shape you created is the one you wanted.

1. Open the Jupyter Notebook file, `Plot CC Shapes`. Note that this notebook is only for `Crystal Type: Hexagonal`.

2. Make sure the second cell contains the information describing the shape file you need to plot.
*`main_folder` should remain `demo` for this tutorial.
*`filename` should be the name you input in the last step of Crystal Creator.
*`kind` must be the keyword associated with the five shapes ('hex', 'kite', 'chair', 'tent', or 'taco').
*`lat_space` is the value you defined in Crystal Creator in the step `Define interdipole spacing`.

3. You should now be able to run the code. It should produce a cross-sectional view of the shape and print the shape's thickness, length, and width. I've also differentiated these values according to display the metal's dimensions, and the shell dimensions (if you have a shell).

4. For the twinned structures, calculating these values is slightly more complicated. Before recording the printed values, make sure the magenta dots are on the same side, i.e., measuring the thickness accurately. Depending on the shape you've created, sometime the pink dots may appear on opposite, diagonal sides and the printed values will not be correct. This is a quick fix if this happens, follow up and I can answer questions.

5. Now, make sure the dimensions are what you wanted them to be. If not, you'll need to remake the shape in Crystal Creator and adjust the distance you selected between the points. If the dimensions are all correct, record them in your data file and proceed to the next stage.




## Stage C: Make Spectra Template Folders
The next step is preparing your simulation files to run DDA on a supercomputer. This is automated in the Jupyter Notebook `Make Spectra Template Folders` which calls the python script `make_mg_template_files.py`. 

1. Create a folder `spectra` in your `../create_files/demo/` folder.

2. Open the file `Make Spectra Template Folders`.

3. Edit the second cell according to your shape file and desired calculation.
* `main_folder`: for this demo, the folder where you've stored your template files is simply `demo`. Change this in the future. 
* `folders`: these should be the extensions you provided when making the shape file. If you follow my convention, you shouldn't have to change this for the demo. Folders for each of your shapes will be created with this name. 
* `kind`: each entry is the name of the shape. Options are 'hex', 'tent', 'taco', 'kite', 'chair'. No other options are permissible. Put a seperate entry for each shape file you'd like to run a simulation on. 
* `lat_space` is the dipole spacing for each shape. 
* `ylength` is only used for naming, so this doesn't have to be exact, just recognizable to you.
* `cluster` is which computer you'd like to run the simulation on, either `esc` or `hpc`.
* `shell` is `True` if you have a shell in your shape file, and `False` if not.
* `CRSid` is your CRSid, which is needed for file locations on the supercomputer. 

4. You should be ready to run the code now. Note that if you run the notebook and it doesn't fully complete (e.g., because of an error message), before running the code again, you'll need to go into `../create_files/demo/spectra` and delete all the folders that were created in there. Otherwise, you'll get an error message, e.g. "File exists '../create_files/demo/spectra/hex' ". This removal can be done automatically by uncommenting the second cell. 

5. Go into `../create_files/demo/spectra` and make sure all your folders and files were copied correctly.




## Stage D: Run the Optical Calculation
The next stages will depend on wheter you're running the calculation on the Earth Science's supercomputer (`esc`) or Cambridge's Research Computing supercomputer (`hpc`). 

For `esc`:
1. Copy your `../create_files/demo/spectra` folder (with all subfolders) onto the supercomputer. Log onto the supercomputer, go into each folder within `spectra` and perform the following steps:
* In command line, load in python libraries by typing `module load anaconda3`.
* Then, create all your folders for each wavelength of the calculation by typing `python make_dirs.py`. This should make many folders in your current directory. It should also make a few submission scripts of the form `launch_temp#.slurm`.
* To submit all the calculations at once, type `sbatch submit_together.slurm`.
* You can monitor the progress of your calculation using `squeue -u <your CRSid>`
* If everything ran correctly, `collect.slurm` also should have run and produced the file `Spectrum`. But this is finicky. If you don't see the file `Spectrum`, simply run `sbatch collect.slurm`. Once this finishes, you should have the file `Spectrum.` If you do not see this file created, go into the `slurm##.out` files and read them to find where the error occured. If that file is empty, go into one of the wavelength folders, and open the `*.out` file. 
* On your local computer, make the file `../data_files`. This is where you'll store all of your simulation data. It should be at the same level as `create_files`. Inside of `../data_files`, create another folder named `demo`. 
* Once all calculations are done, copy your entire `spectra` folder from the supercomputer into `../data_files/demo/`.




## Stage E: Interpret Optical Calculation, Prepare for Thermal Calculation
To plot your data, do the following:
1. Open `Plot Data`, and make sure the first cell contains the correct data according to your simulations. 
2. To plot your shape files, run the third cell. If the shapes are too close to one another, you can change the `horz_shift` and `vert_shift` variables at the beginning of this cell.
3. To plot the spectra you just ran, you can run the following cell. If everything looks good, you can proceed to set up the thermal calculations. 

Most thermal calculations are performed on-resonance. This is automated for you in the notebook: `Make Temperature Template Files`.
1. Make a folder in `../create_files/demo` called `temps`.
2. Open `Make Temperature Template Files` and check the second cell to ensure the parameters are what you need. 
3. Run the notebook.
4. Copy the folder `../create_files/demo/temps` into your `demo` folder on your cluster. Then go into each folder within `demo/temps` and run `sbatch launch.slurm`. This will launch your temperature calculation. 
5. When the calculation is done, you'll know it has run correctly if the file `temp.out` is create and if it is populated. Copy your `temps` folder from the cluster to your local computer, into the location `../data_files/demo/`.




## Stage F: Plot your temperature data
1. Open `Plot Data` notebook again, and this time you can run the final cell.


















