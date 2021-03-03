clc
clear screen
close all
faceDetector = vision.CascadeObjectDetector;
EyeDetector = vision.CascadeObjectDetector('EyePairBig');
NoseDetector = vision.CascadeObjectDetector('Nose');
MouthDetector = vision.CascadeObjectDetector('Mouth');

a = imread('Salman.jpg');  %input image of group of people
 
c = imnoise(a,'salt & pepper',0.01)   %Adding salt and pepper noise
figure, imshow(a)
title('Original image')
figure, imshow(c)
title('Salt and pepper noise image')


Histogram_Equilizer = histeq(c)   %Applying Histogram Equilizer for noise cencelation
figure, imshow(Histogram_Equilizer)
title('Histogram Equilizer')

gray = rgb2gray(c)  %Coverting rgb to gray  
Adapt_hist = adapthisteq(gray); %Apply adaptive histogram
figure, imshow(Adapt_hist);
title('Adapt Histogram Equilizer')


Face_detected = faceDetector(Histogram_Equilizer);  %Detecting face from Histeq image and storing it in Face_detected
Eye_detected = EyeDetector(Histogram_Equilizer);  %Detecting Eye from Histeq image and storing it in Eye_detected
Nose_detected = NoseDetector(Histogram_Equilizer);  %Detecting Nose from Histeq image and storing it in Nose_detected
Mouth_detected = MouthDetector(Histogram_Equilizer);  %Detecting mouth from Histeq image and storing it in Mouth_detected

if Face_detected  %if face is detected then make rectange accross face 
IFaces = insertObjectAnnotation(Histogram_Equilizer,'rectangle',Face_detected,'Face');
else
    disp('No face detected')
end

if Eye_detected
IEyes = insertObjectAnnotation(Histogram_Equilizer,'rectangle',Eye_detected,'Eyes');   
else
    disp('No Eyes detected')
end

if Nose_detected
INose = insertObjectAnnotation(Histogram_Equilizer,'rectangle',Nose_detected,'Nose'); 
else
    disp('No Nose detected')
end

if Mouth_detected
IMouth = insertObjectAnnotation(Histogram_Equilizer,'rectangle',Mouth_detected,'Mouth');     
else
    disp('No Mouth detected')
end

figure, imshow(IFaces)
title('Detected faces from Histogram_Equilizer');  
figure, imshow(IEyes)
title('Detected Eyes from Histogram_Equilizer');
figure, imshow(INose)
title('Detected Nose from Histogram_Equilizer');
figure, imshow(IMouth)
title('Detected Mouth from Histogram_Equilizer');



Face_detected = faceDetector(Adapt_hist);  %Detecting face from Adaptive Histogram image and storing it in Face_detected
Eye_detected = EyeDetector(Adapt_hist);
Nose_detected = NoseDetector(Adapt_hist);
Mouth_detected = MouthDetector(Adapt_hist);
if Face_detected
IFaces = insertObjectAnnotation(Adapt_hist,'rectangle',Face_detected,'Face');
else
    disp('No face detected')
end

if Eye_detected
IEyes = insertObjectAnnotation(Adapt_hist,'rectangle',Eye_detected,'Eyes');   
else
    disp('No Eyes detected')
end

if Nose_detected
INose = insertObjectAnnotation(Adapt_hist,'rectangle',Nose_detected,'Nose'); 
else
    disp('No Nose detected')
end

if Mouth_detected
IMouth = insertObjectAnnotation(Adapt_hist,'rectangle',Mouth_detected,'Mouth');     
else
    disp('No Mouth detected')
end

figure, imshow(IFaces)
title('Detected faces from Adapt hist');
figure, imshow(IEyes)
title('Detected Eyes from Adapt hist');
figure, imshow(INose)
title('Detected Nose from Adapt hist');
figure, imshow(IMouth)
title('Detected Mouth from Adapt hist');


