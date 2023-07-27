% compute correlations of pixels with their neighbors across depths for both 2p and 3p

%current 2p data as of 7/27/23 is from pink61, night2, full z-stack (1st)
%current 3p data as of 7/27/23 is from blue56L, s1, 8 depths recorded (not stacks)
%caveat as of 7/27/23... 3p data is 2X avg, 2p is 2X avg. 
%the 8 depths for 3p data are as follows: 150, 300, 400, 500, 600, 650,700,750

%to save new pixel value data, in Fiji, open Edit>Selection>SelectAll and
%then Analyze>Tools>SaveasXYCoordinates and it will save as a csv file.
%save as twopdata.csv and thrpdata.csv respectively

%load in your variables
[twopdata,thrpdata] = LoadStacks;

twopsize = size(twopdata);
thrpsize = size(thrpdata);

%2p correlations first
rowcorr = []; %horizontal pixel adjacent correlations for 2p
depthcorr2p = []; %average adjacent pixel correlations for each depth
for slice = 1:twopsize(3)
    rowcorr = []; %clear this variable
    px1 = twopdata(:,1:end-1,slice); %isolate pixels
    px2 = twopdata(:,2:end,slice); %offset pixel values
    for row = 1:twopsize(1)
        c = corrcoef(px1(row,:),px2(row,:)); %find correlation for each row
        rowcorr(row) = c(2);
    end
    depthcorr2p(slice) = mean(rowcorr);
end

%3p correlations now
rowcorr = []; %horizontal pixel adjacent correlations for 3p
depthcorr3p = []; %average adjacent pixel correlations for each depth
for slice = 1:thrpsize(3)
    rowcorr = []; %clear this variable
    px1 = thrpdata(:,1:end-1,slice); %isolate pixels
    px2 = thrpdata(:,2:end,slice); %offset pixel values
    for row = 1:thrpsize(1)
        c = corrcoef(px1(row,:),px2(row,:)); %find correlation for each row
        rowcorr(row) = c(2);
    end
    depthcorr3p(slice) = mean(rowcorr);
end