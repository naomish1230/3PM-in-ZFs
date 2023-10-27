function [twopdata,thrpdata] = LoadStacks

%load in image sequence as a multipage mat variable 

%list directory of 2p image sequence
%load in each tiff as a tiff object
%read the image data, save it in multipage mat file
%repeat for 3p data
addpath('/Users/naomishvedov/Documents/GitHub/3PM-in-ZFs/twop_z_series/');
addpath('/Users/naomishvedov/Documents/GitHub/3PM-in-ZFs/thrp_z_series/');
mydir2 = dir('/Users/naomishvedov/Documents/GitHub/3PM-in-ZFs/twop_z_series');
mydir3 = dir('/Users/naomishvedov/Documents/GitHub/3PM-in-ZFs/thrp_z_series');

slice = [];
count = 0;
twopdata = []; %preallocate multipage tiff file
for tw = 3:length({mydir2.name}); %starts on 3rd row
    count = count + 1; %counter because index is off by 3
    slice = []; %clear the previous slice
    slice = Tiff(mydir2(tw).name);
    slice = read(slice);
    twopdata(:,:,count) = slice; %make multipage tiff for zstack
end
%save('twopdata.mat','twopdata')

slice = [];
count = 0;
thrpdata = []; %preallocate multipage tiff file
for tw = 3:length({mydir3.name}); %starts on 3rd row
    count = count + 1; %counter because index is off by 3
    slice = []; %clear the previous slice
    slice = Tiff(mydir3(tw).name);
    slice = read(slice);
    thrpdata(:,:,count) = slice; %make multipage tiff for zstack
end
end
