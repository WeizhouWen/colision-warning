 fasterRCNN = vehicleDetectorFasterRCNN('full-view');

function [distance]=project3(fasterRCNN)
%I = imageaqu4;
I=imread('E:\study\FYP\project\testpicture\640480\110.png');
%figure
%imshow(I)

[bb,sc] = detect(fasterRCNN,I);
a=bb(1,3)
I = insertObjectAnnotation(I,'rectangle',bb,a);
figure
imshow(I)





f=560;%based on 30 cm 530 pixels about 140mm
distance=((8*f)/a)*0.24 %m in real

end

 
