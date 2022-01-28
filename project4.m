%23Feb

function [distance]=project4(I) 
    
 %figure(1),imshow(I);title('the input photo')
%  I=imread('E:\study\FYP\实验\30cm.jpg');

 I1 = rgb2gray(I);
  figure(2),imshow(I1);title('2:the gray photo')
 
I2=edge(I1,'prewitt');
 figure(3),imshow(I2);title('3:operator prewitt edge detection without fileter')
 
% c=[730 1320 1330 732];
% r=[215 215 703 703];
% BW=roipoly(I1,c,r);  % area
% 
% h = fspecial('unsharp');
% I2=roifilt2(h,I1,BW);

I3=bwperim(I2);
 figure(4),imshow (I3); title('4:after filter')

 

 se=strel('disk',10,4);
 I4=imclose(I3,se);


 %I4=imfill(I4,'holes');
 figure(5),imshow(I4);title('5.after close');

I5=imopen(I4,se);         
 figure(6),imshow(I5);title('6.after open');
 

 I6=bwareaopen(I5,2000); %eremove small item
   figure(7),imshow(I6); title('7.remove small item')

% I7=imfill(I6,'holes');            
%  figure(7),imshow(I7);title('fill the hole');
I7=I6;
[Row, Col]=size(I7);

Sum=zeros([Row 1]);
% Left=zeros([Col 1])+9999;
% Right=zeros([Col 1]);

for m=1:1:Row
%     if(m>180&&m<260)
%      for n=1:1:Col-1
%              if (I7(m,n+1)-I7(m,n)==1)
%                  Left(n+1)=n+1;
%              end    
%      end
%     
%       for n=1:1:Col-1
%          if (I7(m,n)-I7(m,n+1)==1)
%               Right(n+1)=n+1;
%          end
%       end
%     end
 for n=1:1:Col
      Sum(m)=Sum(m)+I7(m,n);
    end

end
% min(Left)
% max(Right)
% wideth=max(Right)-min(Left)
wideth=max(Sum)
f=570;%based on 30 cm 590 pixels on 30 cm
distance=((8*f)/wideth)*0.24 %m in real

end