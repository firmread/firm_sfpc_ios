#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetOrientation(OF_ORIENTATION_90_LEFT);
    number = 0;
    font.loadFont("apr.otf", 32);

    int buttonSize = ofGetWidth()/8;
    for (int i = 0 ; i < 8; i++) {
        inputs[i].set(ofGetWidth() - i*buttonSize, ofGetHeight()-buttonSize, -buttonSize, buttonSize);
    }
}

//--------------------------------------------------------------
void ofApp::update(){
    for (int i = 0; i < 8; i++) {
        if (bInputs[i]) {
            //            setBit(number, i);
            number |= 1 << i;
        }
        else //clearBit(number, i);
        number &= ~(1 << i);

    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    
    font.drawString( ofToString(number), 50, 50);
//    ofDrawBitmapStringHighlight(ofToString(number), 50, 50);
    
    for (int i = 0; i < 8; i++){
        if ((number >> (7-i)) & 0x01){
            font.drawString(  "1" , 50 + i * 30, 100);
//            ofDrawBitmapStringHighlight("1", 50 + i * 30, 100);
        }
        else {
            font.drawString(  "0" , 50 + i * 30, 100);
//            ofDrawBitmapStringHighlight("0", 50 + i * 30, 100);
        }
        
    }
    
    ofSetCircleResolution(4);
    ofSetColor(number);
    ofCircle(ofGetWidth()/2, ofGetHeight()/2, 30);
    
    
    ofPushStyle();
    ofSetColor(ofColor::cyan);
    ofSetLineWidth(3);
    
    for (int i = 0; i < 8; i++){
        
        if(!bInputs[i])ofNoFill();
        else ofFill();
        ofRect(inputs[i]);
    }
    ofPopStyle();
}


void ofApp::setBit(int var, int bit){
    
    var |= 1 << bit;
}

void ofApp::clearBit(int var, int bit){
    
    var &= ~(1 << bit);
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    
    for (int i = 0; i<8; i++) {
        if(inputs[i].inside(touch.x, touch.y)){
            bInputs[i] = true;
        }
    }
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
    
    for (int i = 0; i<8; i++) {
        if (inputs[i].inside(touch.x, touch.y)) {
            bInputs[i] = false;
        }
    }
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

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
