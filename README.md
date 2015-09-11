# PotentialLeakOfVCUsingRN
##Description
A demo repository to show potential leaks of VC and bridge leaks using React Native. It's to show the issue [2598](https://github.com/facebook/react-native/issues/2598) of react-native.  

##Problem
The `TwoViewController` won't get deallocated, as well as the `RCTBridge` backing up the `RCTRootView`.  
##Reason
The reason why controllers and bridges won't get deallocated is there is a retain cycle in between. 
![graph](/Users/baidu/Desktop/屏幕快照 2015-09-11 下午4.27.23.png)
##Solution

##Usage
Run `pod install` first in the 'VCAndRCTBridgeLeakDemo' directory.


