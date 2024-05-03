from mss.windows import MSS as mss
import mss.tools
import cv2
import win32gui

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
