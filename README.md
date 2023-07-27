# 3PM-in-ZFs
Pertinent data and code for three-photon microscopy in UBC-GFP zebra finches.


1. The current 2p and 3p image tiff files can be found in twop_z_series and thrp_z_series respectively.

2. You can load the pixel values in from the tiffs using the LoadStacks.m function. Make sure to change the path name.

3. If you want to find the average adjacent pixel correlations (horizontally) across depths, and plot, use the PixelCorrelationsAcrossDepthComparison.m.
   This function calls the LoadStacks.m function. Make sure to change the path name in the LoadStacks.m function.
   
