import cv2
import numpy as np
from mss.windows import MSS as mss
import mss.tools
import win32gui
import win32api
import win32con
import time
import pyautogui
import os
import glob

def ReadImages():
    path = "mobs/deer/"
    files = glob.glob(path + "*.png")
    filenames = []
    imageArray = []
    for f in files:
        _, tail = os.path.split(f) 
        filenames.append(tail)
        imageArray.append(cv2.imread(path + tail, cv2.IMREAD_UNCHANGED))
    #Filenames is all the files names with extension, to use for image reading
    return imageArray

def callback(win2find):
    whnd = win32gui.FindWindowEx(None, None, None, win2find)
    if not (whnd == 0):
        print('FOUND!')

    rect = win32gui.GetWindowRect(whnd)
    x = rect[0]
    y = rect[1]
    w = rect[2] - x
    h = rect[3] - y
    print("Window %s:" % win32gui.GetWindowText(whnd))
    print("\tLocation: (%d, %d)" % (x, y))
    print("\t    Size: (%d, %d)" % (w, h))
    dimensions = [x,y,w,h]
    return dimensions


def ScreenGrab(windowTitle):
    dimensions = callback(windowTitle)
    with mss.mss() as sct:
        # The screen part to capture
        monitor = {"top": dimensions[1], "left": dimensions[0], "width": dimensions[2], "height": dimensions[3]}
        output = "screenshot.png".format(**monitor)

        # Grab the data
        sct_img = sct.grab(monitor)

        # Save to the picture file
        mss.tools.to_png(sct_img.rgb, sct_img.size, output=output)
        screenshot = cv2.imread(output, cv2.IMREAD_UNCHANGED)
        return screenshot




def ImageSearch(ImageToBeSearchedFor):
    threshold = .50 #Percentage, how close does the image have to be to count?
   
    dimensions = callback("Heartwood Online")
    screenshot = cv2.cvtColor(ScreenGrab("Heartwood Online"), cv2.COLOR_BGR2GRAY) 

    grayImageToBeSearchedFor = cv2.cvtColor(ImageToBeSearchedFor, cv2.COLOR_BGR2GRAY) 


    result = cv2.matchTemplate(screenshot, grayImageToBeSearchedFor, cv2.TM_CCOEFF_NORMED)

    min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(result)

    #Get Image Dimensions
    w = ImageToBeSearchedFor.shape[1]
    h = ImageToBeSearchedFor.shape[0]

    #Get Y / X location where the result positions are greater % compared to threshold 
    yloc, xloc = np.where(result >= threshold)

    #combine overlapping trianglesa
    rectangles = []
    for (x,y) in zip(xloc,yloc):
        rectangles.append([int(x),int(y),int(w),int(h)])
        rectangles.append([int(x),int(y),int(w),int(h)])

        finalx = x+dimensions[0]+w
        finaly = y+dimensions[1]+h


        halfwindowx = dimensions[0] / 2
        halfwindowy = dimensions[1] / 2
        if(x>=halfwindowx):
            #if x is passed half-width, add image width to click position
            finalx = x + dimensions[0]

        if(x<halfwindowx):
            finalx = x + dimensions[0]

        
        if(y>=dimensions[1]/1.25):
            finaly = y + dimensions[1]

        if(y<=halfwindowy):
            finaly = y + dimensions[1]
        

        pyautogui.click(finalx,finaly)
           
    
    rectangles, weights = cv2.groupRectangles(rectangles,1,0.2)
    
    #Draw Rectangles that have been overlapped
    for (x,y,w,h) in rectangles:
        cv2.rectangle(screenshot, (x,y), (x+w, y+h), (255,255,255), 2)

    #Return Image
    return screenshot


def Bot():
    #ReadImages should return the ImageArray Variable which should contain an array of images opened via cv2.imread
    for image in ReadImages(): #Iterate through the returned array of images, search for these images on the screenshot taken
        ImageSearch(image)
Bot()