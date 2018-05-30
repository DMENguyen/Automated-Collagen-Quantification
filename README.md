# Automated Collagen Quantification for Aortic Wall
This is the public-facing repository for the m-files for quantifying collagen between the adventitia and media of abdominal aortic aneurysms stained with picrosirius red

# Running with MATLAB
* [Download](https://github.com/Imperssonator/GTFiber-Windows/archive/master.zip) the repository to your local machine
* Extract the repository to your MATLAB active directory
* Run the m-file "Automatic_Collagen_Quant_AAA_PSR"
* Operate the program as instructed below

# Using the Program
* This program requires complementary images of a section of PSR-stained aneurysm tissue, one taken using bright-field microscopy and the other using polarized light microscopy
* The images must be added to the MATLAB active directory path
* Load the image obtained from bright-field microscopy by pressing the "Load Bright Field" button and finding the desired file
* Load the image obtained from polarized light microscopy by pressing the "Load Polarized" button and finding the desired file
* If desired, check the box next to "Scale Bar" and input the lengths of the scale bar in pixels and micron, in their respective fields
* If the bright-field microscopy and polarized microscopy images are not properly aligned, check the "Offset" field and input the x and y offsets in their respective fields
* Press the "Process" button to begin processing the paired images to obtain the amount of collagen within the images by pixel counts and percentages
