#PLEASE NOTE THIS: MATT'S CODE HAS NOTICEABLE FUCNTIONS, 
#OURS IS JUST LISTED BUT WILL BE PUT INTO INDIVIDUAL METHODS SOON
#not in class or method format, this was solely used to test out the functions and use on a single image

import numpy as np
import cv2
from matplotlib import pyplot as plt
from copy import deepcopy

def get_point(event,x,y,flags,param):
    if event == cv2.EVENT_LBUTTONDBLCLK:
        cv2.circle(img,(x,y),1,(255,0,0),-1)
        print x,y

#quick fix for playing with the output position of the calibration
#  quadrilateral such that we are zoomed out correctly
def tune_output_square(scale,translate,points):
    newpoints = deepcopy(points)
    avg_x = (points[0][0] + points[1][0] + points[2][0] + points[3][0])/4
    avg_y = (points[0][1] + points[1][1] + points[2][1] + points[3][1])/4
    for n in range(0,4):
        newpoints[n][0] = avg_x - (avg_x - points[n][0])*scale + translate[0]
        newpoints[n][1] = avg_y - (avg_y - points[n][1])*scale + translate[1]
    return newpoints

#for helping me find the corners of the square..
#  This just outputs the px values on a horizontal line on the image
#  and then paints this line green for reference
def sample_lines():
    for n in range(493,794):
        print (img[481,n])
        img[481,n] = (0,255,0)
        print n
    print "NEEEEEXT\n\n\n\n\n\n\n"
    for n in range(486,698):
        print (img[457,n])
        img[457,n] = (0,255,0)
        print n

def find_vertex(M,imgx):
    #initialize boundary points
    points = np.matrix([[0,   0    , 800, 800],
                        [600, 800  , 600, 800],
                        [1, 1    , 1  , 1  ]])
    #calculate transformed points (in homogeneous coordinates)
    homopoints = M * points
    #convert homogeneous points to xy
    newpoints = np.zeros((2,4))
    for i in range(0,2):
        for j in range(0,4):
            newpoints[i,j] = homopoints[i,j]/homopoints[2,j]

    print newpoints
    #calculate line parameters for both boundaries
    m1 = (newpoints[1,1] - newpoints[1,0]) / (newpoints[0,1] - newpoints[0,0])
    m2 = (newpoints[1,3] - newpoints[1,2]) / (newpoints[0,3] - newpoints[0,2])
    b1 = newpoints[1,0] - m1*newpoints[0,0]
    b2 = newpoints[1,2] - m2*newpoints[0,2]
    #calculate intersection point of these lines
    xint = (b1-b2)/(m2-m1)
    yint = (m1*xint+b1)
    cv2.line(imgx, (int(newpoints[0,0]),int(newpoints[1,0])) , (int(xint),int(yint)) , (0,0,255),1)
    cv2.line(imgx, (int(newpoints[0,2]),int(newpoints[1,2])) , (int(xint),int(yint)) , (0,0,255),1)
    print xint, yint




#testpiece = cv2.imread('template.jpg', 0) #the zero converts it to grayscale) overall pic from jacob
#testpiece2 = testpiece.copy() #why are we copying?
piece_to_match = cv2.imread('smallpart.png', 0) #small part of image to be matched with overall/larger one, 0 converts it to grayscale 
w, h = piece_to_match.shape[::-1]
img_location = 'course.jpg' #what the camera sees
img = cv2.imread(img_location)
rows,cols,ch = img.shape
print rows, cols, ch




#set up clicking behavior on the raw image
cv2.namedWindow('image')
cv2.setMouseCallback('image',get_point)
#cv2.waitKey(0)

#sample_lines()

#calculate xform matrix
orig = np.float32([[556,481],[509,457],[783,481],[669,457]])
#assuming square is 227px big
guess = np.float32([[556,481],[556,254],[783,481],[783,254]])
new = tune_output_square(.4,[-160,170],guess)
#calculate transform matrix
M = cv2.getPerspectiveTransform(orig,new)

#remap original image by applying transform matrix
imgx = cv2.warpPerspective(img,M,(800,800))

#figure out if the vertex is in the right location
find_vertex(M,imgx)

#write image
cv2.imwrite('xformed.png',imgx)

while(1):
    cv2.imshow('image',img)
    cv2.imshow('xformed',imgx)


    if cv2.waitKey(20) & 0xFF == 27:
        break
cv2.destroyAllWindows()


#image = imgx
#finalimage = cv2.imread(image)

grayscale = cv2.cvtColor(imgx, cv2.COLOR_BGR2GRAY)
cv2.imshow("grayscale image", grayscale)
cv2.waitKey(0)

 
lower_white = np.array([0, 0, 170], np.uint8)  #estimated values until testing
upper_white = np.array([179, 20, 255], np.uint8) #estimated values until testing
# Searching the HSV image to extract the white colors
camera_image_binary = cv2.adaptiveThreshold(grayscale,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C,\
            cv2.THRESH_BINARY,11,2)

matching_image_binary = cv2.adaptiveThreshold(piece_to_match,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C,\
            cv2.THRESH_BINARY,11,2)
#course_image_binary = cv2.adaptiveThreshold(,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C,\
          #  cv2.THRESH_BINARY,11,2)
#extracted_white = cv2.inRange(hsveye, lower_white, upper_white)
#i believe since we thresholded it we do not need to use inRange as it is just another binary assignment function 
#thresholding works better with similar colors and what not for the sake of the project
#with complicated detailed images though things get a little muddy but for the sake of the course and time this should work for now
cv2.imshow("Thresholded image", camera_image_binary)
cv2.waitKey(0)

kernel = np.ones((3,3), np.uint8) #square of 2x2 pixels to use for dilating
kernel2 = np.ones((2,2), np.uint8) #square of 1x1 pixels to use for eroding
eroded_image = cv2.erode(camera_image_binary,kernel2,iterations = 1)
cv2.imshow("cleaned up image", eroded_image)
cv2.waitKey(0)

dilated_image = cv2.dilate(eroded_image, kernel, iterations = 1)
cv2.imshow("dilated image", dilated_image)
cv2.waitKey(0)

eroded_match = cv2.erode(matching_image_binary, kernel2, iterations = 1)
dilated_match = cv2.dilate(eroded_match, kernel, iterations =1)
cv2.imshow("piece to match dilated", dilated_match)
cv2.waitKey(0)
cv2.destroyAllWindows
#cv2.imshow("dilated course", course_image_binary)
#cv2.waitKey(0)
#cv2.destroyAllWindows

methods = ['cv2.TM_CCOEFF', 'cv2.TM_CCOEFF_NORMED', 
            'cv2.TM_CCORR_NORMED', 'cv2.TM_SQDIFF_NORMED']
#all of the above methods should work for the sake of the project and the course
for meth in methods:
    img = imgx.copy()
    method = eval(meth)

    # Apply template Matching
    res = cv2.matchTemplate(dilated_image,dilated_match,method)
    min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(res)

    # If the method is TM_SQDIFF or TM_SQDIFF_NORMED, take minimum
    if method in [cv2.TM_SQDIFF, cv2.TM_SQDIFF_NORMED]:
        top_left = min_loc
    else:
        top_left = max_loc
    bottom_right = (top_left[0] + w, top_left[1] + h)

    cv2.rectangle(img,top_left, bottom_right, 255, 2)

    plt.subplot(121),plt.imshow(res,cmap = 'gray')
    plt.title('Matching Result'), plt.xticks([]), plt.yticks([])
    plt.subplot(122),plt.imshow(img,cmap = 'gray')
    plt.title('Detected Point'), plt.xticks([]), plt.yticks([])
    plt.suptitle(meth)

    plt.show()


#still waiting to see if we need to use contours
##contours,hierarchy = cv2.findContours(np.array(extracted_white,np.uint8), cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE) 
#next step is to look at moments function and use that
#blunt force feature mapping is an option
#look for L-stein algorithm to use in two dimensions
#opencv tutorial for that
#research more into moments function





