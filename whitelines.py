import numpy as np #math library
import cv2

#captured_video = cv2.VideoCapture(0)
#captures the video feed from front camera


class WhiteLineDetection:
	def captureVid(self):
        captured_video = cv2.VideoCapture(0)
        #captures the video feed from front camera
		
        ##need to define out fourcc = cv2.VideoWriter_fourcc(*'XVID')
		##out = cv2.VideoWriter('output.avi',fourcc, 20.0, (640,480))
		
		while(captured_video.open() == true): #only works if the video is actually taking
			ret, videoframes = captured_video.read() #gets a frame by frame

#if ret == True:
#out.write(frame)
        #changing image color scale to HSV but it is light sensitive?
        hsvimages = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

        # define our range of white color in the hsv color scale
        #for hue we are just going to include the entire range, since sat is = 0 it shouldnt matter hue range
        #we want low values for saturation and high values for value to detect white
        lower_blue = np.array([0, 0, 200])  #estimated values until testing
        upper_blue = np.array([179, 20, 255]) #estimated values until testing

        # Searching the HSV image to extract the white colors
        mask = cv2.inRange(hsv, lower_green, upper_green)



        cv2.imshow('videoframes', hsvimages)
            if cv2.waitKey(1) & 0xFF == ord('q'):
                break

			else: 
				break



			#saves frame
			#cv2.imshow('videoframes', camimages)

	    cap.release()
        # out.release()
	    cv2.destroyAllWindows()

#For HSV, Hue range is [0,179], Saturation range is [0,255] and Value range is [0,255].


#chekcing to see if I figured it out
}