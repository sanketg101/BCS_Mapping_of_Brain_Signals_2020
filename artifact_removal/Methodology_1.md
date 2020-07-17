## Artifact Removal

The eye tracker used in the experiment continuously recorded the X and the Y coordinates of the eye. The purpose of recording the eye data was to be able to detect the blinks and the saccades during the experiment and later modify the EEG data by removing these artifacts. To detect saccades and blinks we followed the following steps:

1) At first, we had plotted the X-Y graphs to visualise the position of the eye at various intervals of time and undertsand eye movement.
2) Then X-T and Y-T graphs were plotted to get a better understanding. It was observed from these graphs that during the saccades, there is a simultaneous shift in both the X-T      and the Y-T graphs. Also various spikes were observed. During these spikes, it could be seen that the X coordinate value reached ~(-50) degrees and the Y coordinate value 
   reached ~20 degrees. The discontinuity in these plots could be clearly observed during these spikes. Also, the visual field was 20deg X 20deg. Thus, it was concluded that these 
   spikes represent the blinks.
3) The velocity graphs were then calculated using a convolution based method. It was observed that during the blink regions, the velocity shooted up very high. This was used as a 
   further conclusion to identify the blinks.
4) The values for X and the Y coordinates were made to NaN for the blink regions.
5) The X and the Y coordinates were then filtered using a smoothing technique. Now convolution was used to calculate the V-T graph after the removal of blinks.
6) Simultaneously, the displacement curve was also calculated. 
7) The velocity curve was then further smoothed and compared with the displacement curve to find the timestamps of the saccades.

The following link gives a detailed presentation describing the path used to remove blinks and detect the saccades. The presentation includes the graphs and the codes as well.
* [Eye Data Processing] https://docs.google.com/presentation/d/1UuoW18Oohm3VGgWmZarZMC6u_dEdMHzRNl6bdSQf4V8/edit?usp=sharing

The codes for the different stages have been uploaded.

