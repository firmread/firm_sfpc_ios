#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){	
    
    ofSetVerticalSync(true);
    ofSetOrientation(OF_ORIENTATION_90_LEFT);
    grabber.initGrabber(480, 360, OF_PIXELS_BGRA);
    grabberAsGray.allocate(480, 360, OF_IMAGE_GRAYSCALE);
    for (int i = 0; i < 8; i++){
        bitPlanes[i].allocate(480, 360, OF_IMAGE_GRAYSCALE);
    }
}

//--------------------------------------------------------------
void ofApp::update(){
    
    
    grabber.update();
    
    if (grabber.isFrameNew()){
        
        unsigned char * colorPix = grabber.getPixels();
        unsigned char * grayPix = grabberAsGray.getPixels();
        
        for (int i = 0; i < 480*360; i++){
            grayPix[i] = colorPix[i*3];
            
            for (int j = 0; j < 8; j++){
                bitPlanes[j].getPixels()[i] = (grayPix[i] >> (7-j)) & 0x01 ? 255 : 0;
            }
        }
        
    }
    
    grabberAsGray.update();
    for (int i = 0; i < 8; i++){
        bitPlanes[i].update();
    }
    
}

//--------------------------------------------------------------
void ofApp::draw(){
	
    grabberAsGray.draw(0,0);
    
    for (int i = 0; i < 8; i++){
        bitPlanes[i].draw((i%4)*ofGetWidth()/4, 360 + (i/4) * ofGetWidth()/4 * (360.0/480.0),ofGetWidth()/4, ofGetWidth()/4 * (360.0/480.0));
    }
    
}


void ofApp::changeCamera(int num){
    grabber.close();
    grabber.setDeviceID(num);
    grabber.initGrabber(480,360); // change this to your settings
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    camera = !camera;
    changeCamera(camera);
    
}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}
