import subprocess,os,threading,datetime;
from robot.libraries.BuiltIn import BuiltIn
from robot.libraries.Screenshot import Screenshot
from PIL import Image
import pyocr
import pyocr.builders
import cv2
import numpy as np
import sys
import time


 
def run_command(cmd,os_name='posix'):
	p = subprocess.Popen(cmd,shell=True,cwd=os.getcwd())
	output,err = p.communicate()
	print 'output=%s'%output
	print 'err=%s'%err
	return output
	

	
def start_appium_server(appium_command):
    t=threading.Thread(target=run_command,args=(appium_command,))
    t.daemon=True
    t.start()
	    
def take_continous_screenshots(n):
   appiumlib = BuiltIn().get_library_instance('AppiumLibrary')    
   max=int(n)
   start=0
   while (start<max):
       start=start+1
       t=threading.Thread(target=take_screen_shot,args=(appiumlib,start,))
       t.daemon=True
       t.start()
       print  datetime.datetime.now()

	     
def take_screen_shot(name):
   appiumlib = BuiltIn().get_library_instance('AppiumLibrary')    
   print dir(appiumlib)
   appiumlib.capture_page_screenshot(str(name)+'.PNG')   
   
   
def verify_text_present_on_image(name,text):
    take_screen_shot(name)
    name=os.getcwd()+"/images/"+name+'.PNG'
    tools = pyocr.get_available_tools()       
    tool = tools[0]
    langs = tool.get_available_languages()
    lang = langs[0]
	
    rendered_text = tool.image_to_string(
	    Image.open(name),
	    lang=lang,
	    builder=pyocr.builders.TextBuilder()
    )
    #print (str(rendered_text))
    print ('text=%s'%rendered_text)
    
    if rendered_text.find(text) == -1:	
        screenshotLib = BuiltIn().get_library_instance('Screenshot')
        screenshotLib._embed_screenshot(name,200)
        raise Exception('The text %s is not displayed in the image'%text)
        
def click_by_image():
    img_rgb = cv2.imread('/Users/syam/Documents/vodqa/vodQA_Advanced/bef.png')
    template = cv2.imread('/Users/syam/Documents/vodqa/vodQA_Advanced/toggle.png')
    w, h = template.shape[:-1]
    res = cv2.matchTemplate(img_rgb, template, cv2.TM_CCOEFF_NORMED)
    threshold = .5
    loc = np.where(res >= threshold)
    pt=zip(*loc[::-1])[0]
    cv2.rectangle(img_rgb, pt, (pt[0] + w, pt[1] + h), (0, 0, 255), 2)
    cv2.imwrite('result.png', img_rgb)
    
    x=pt[0]+w/2
    y=pt[1]+h/2
    
    print x
    print y
    return x,y
    
def image_should_be_visible(image_name, threshold):
    try:
        current_screen='screen';
        take_screen_shot(current_screen)
        img_rgb = cv2.imread(os.getcwd()+"/"+current_screen+".png")
        template = cv2.imread(os.getcwd()+"/images/"+image_name+".png")
        w, h = template.shape[:-1]
        res = cv2.matchTemplate(img_rgb, template, cv2.TM_CCOEFF_NORMED)
        thre=float(threshold)
        loc = np.where(res >= thre)
        pt=zip(*loc[::-1])[0]
    except:
        raise Exception('Image not found')
    return pt,img_rgb,w,h
    
    
    
def find_coordinates_of_image(image_name, threshold):

    pt,img_rgb,w,h= image_should_be_visible(image_name, threshold)
    cv2.rectangle(img_rgb, pt, (pt[0] + w, pt[1] + h), (0, 0, 255), 2)

    cv2.imwrite('result.png', img_rgb)
    
    x=pt[0]+w/2
    y=pt[1]+h/2
    
    print x
    print y
    return x,y

def get_screen_size():
    appiumlib = BuiltIn().get_library_instance('AppiumLibrary')
    window_size = appiumlib.get_element_size("//*");
    print window_size
    max_width = window_size["width"] - 1
    max_height = window_size["height"] - 1 
    return max_width,max_height


    
    
def swipe_down(maxAttempt):
    count =0
    max = int(maxAttempt)
    maxwidth,maxheight = get_screen_size()
    starty = int(maxheight * 0.50)
    endy = int(maxwidth*0.20) 
    startx = int(maxwidth*0.50)
    appiumlib = BuiltIn().get_library_instance('AppiumLibrary')
    
  
    while count<max:
        count=count+1
        appiumlib.swipe(startx, starty, startx, endy)
        time.sleep(1)
        
        
def swipe_right(maxAttempt):
    count =0
    max = int(maxAttempt)
    maxwidth,maxheight = get_screen_size()
    starty = int(maxheight * 0.8)
    startx = int(maxwidth*0.8)
    endx = int(maxwidth*0.20) 
    
    appiumlib = BuiltIn().get_library_instance('AppiumLibrary')
    
  
    while count<max:
        count=count+1
        appiumlib.swipe(startx, starty, endx, starty)
        time.sleep(1)
    



