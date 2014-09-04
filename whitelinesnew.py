import numpy as np #math library
import cv2
#other imports we need????


#we need to write all of the different operations as methods....not sure if we need a class structure
class WhiteLineDetection:

    def captureVid(self):
        captured_video = cv2.VideoCapture(0)
            #captures the video feed from front camera
        if not captured_video.open():
            print ("error: image not accessed succesfully")
            return(1)
                #error catching...duh
        while(captured_video.open() == true): #only works if the video is actually taking
            ret, videoframes = captured_video.read() #gets a frame by frame
                #ask what the purpose of ret is and if we really need it
        ##need to define out fourcc = cv2.VideoWriter_fourcc(*'XVID')
		##out = cv2.VideoWriter('output.avi',fourcc, 20.0, (640,480))
        return videoframes
        #need the following two lines of code commented out?
        #if ret == True:
        #out.write(frame)

    def changecolorscale(self, videoframes): #doweneedself
        #changing image color scale to HSV but it is light sensitive?
        hsvimages = cv2.cvtColor(videoframes, cv2.COLOR_BGR2HSV)
        # define our range of white color in the hsv color scale
        #For HSV, Hue range is [0,179], Saturation range is [0,255] and Value range is [0,255].
        #for hue we are just going to include the entire range, since sat is = 0 it shouldnt matter hue range
        #we want low values for saturation and high values for value to detect white
        lower_white = np.array([0, 0, 200], np.uint8)  #estimated values until testing
        upper_white = np.array([179, 20, 255], np.uint8) #estimated values until testing

        # Searching the HSV image to extract the white colors
        extracted_white = cv2.inRange(hsvimages, lower_white, upper_white)
        #is extracted white and array, python allows you to use and declare on same line, 
        #but how can you store all of that meaning like an entire image frame in one array
        
        return extracted_white
        #is thresholding necessary if we use .inRange if so see code line below
        #thresh = lambda input_image, C_val: cv2.adaptiveThreshold(input_image,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY_INV, makeOdd(194),C_val)


    def reducenoise(self, binary_image):
       #this is where we take the binary image created in inRange functoin and reduce the noise and stuff associated with it
        #create structuring element that will be used to "dilate" and "erode" image.
        #the element chosen here is a 3px by 3px rectangle

        #need to use the extracted white thing that we have
        #need to create rectangles to serve as reference
        #so that we can reduce noise and enlarge the image we want
        #some people use erosion and dilation, we are using the function opening
        kernel = np.ones((5,5), np.uint8) #square of 5x5 pixels to use for eroding and dialating
        opening = cv2.morphology(binary_image, cv2.MORPH_OPEN, kernel)

        return opening

        #still dont know if we need this line following or where it goes.
        #somewhat important thresh = lambda input_image, C_val: cv2.adaptiveThreshold(input_image,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY_INV, makeOdd(194),C_val)

            
    def main():
        whitelinefinder = WhiteLineDetection()

        first_step = whitelinefinder.captureVid()

        second_step = whitelinefinder.changecolorscale(first_step)

        third_step = whitelinefinder.reducenoise(second_step)

        




			




#chekcing to see if I figured it out



##TO DO WHILE I'M GONE: figure out how to erode and dialate , create the rectangular 
#shpaes with the correct pixel dimensions to use as reference for what is noise and what isnt
#figure out what he meant by thresh, pull up c++ documentation for dilate and erode functions to figure it output