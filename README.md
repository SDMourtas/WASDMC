# WASDMC
Implementation of a 3-layer feed-forward neural network model for multiclass classification that was trained using a weights-and-structure-determination for multiclass classification (WASDMC) algorithm.\
The purpose of this package is to classify occupations based on the International Standard Classification of Occupations (ISCO) through a WASDMC-based neural network.\
The main articles used are the followings:
*	D. Lagios, S.D. Mourtas, P. Zervas and G. Tzimas, "A Weights Direct Determination Neural Network for International Standard Classification of Occupations," (submitted)

Also, the kit includes the following two datasets:
*	ILO-ISCO, taken from https://www.ilo.org/ilostat-files/ISCO/newdocs-08-2021/ISCO-08/ISCO-08\%20EN\%20Structure\%20and\%20definitions.xlsx
*	OS-ISCO, taken from https://doi.org/10.1007/978-3-031-08341-9_27

# M-files Description
*	Main_WASDMC.m: the main function
*	problem.m: input data of the neural networks
*	preprocessText.m: function for preprocessing data
*	problem_figures.m: figures illustrating the problem's findings
*	WASDMC.m: function for finding the optimal number of hidden-layer neurons, along with the optimal weights of the neural network
*	WASDMC_PAF.m: function for finding the optimal number of hidden-layer neurons, along with the optimal weights of the neural network (includes alternative activation function)
*	Zmatrix.m: function for calculating the matrix Z
*	Zmatrix_PAF.m: function for calculating the matrix Z (includes alternative activation function)
*	predictN.m: function for predicting
*	predictN_PAF.m: function for predicting (includes alternative activation function)
*	error_pred.m: function for calculating the mean absolute error (MAE) of the prediction
*	FTree.mat: MATLAB's fine Tree model 
*	FKNN.mat: MATLAB's fine KNN model 
*	EBT.mat: MATLAB's Ensemble Bagged Trees model
*	NNN.mat: MATLAB's Narrow Neural Network model

Also, the kit includes the following two functions:
* kappa.m, taken from https://www.mathworks.com/matlabcentral/fileexchange/15365-cohen-s-kappa
* confusion.m, taken from https://www.mathworks.com/matlabcentral/fileexchange/60900-multi-class-confusion-matrix?s_tid=srchtitle

# Installation
*	Unzip the file you just downloaded and copy the WASDMC directory to a location,e.g.,/my-directory/
*	Run Matlab/ Octave, Go to /my-directory/WASDMC/ at the command prompt
*	run 'Main_WASDMC (Matlab/Octave)

# Results
After running the 'Main_WASDMC.m file, the package outputs are the following:
*	The optimal number of hidden-layer neurons.
*	The neural network models' statistics on the testing set of the datasets.
*	The graphic illustration of the classification performance.

# Environment
The WASDMC kit has been tested in Matlab 2021a on OS: Windows 10 64-bit.
