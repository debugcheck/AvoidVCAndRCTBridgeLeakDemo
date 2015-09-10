# PotentialLeakOfVCUsingRN
##Description
A demo repository to show potential leaks of VC and bridge leaks using React Native. It's to show the issue [2598](https://github.com/facebook/react-native/issues/2598) of react-native.  

The `TwoViewController` won't get deallocated, as well as the `RCTBridge` backing up the `RCTRootView`.  

##Usage
Run `pod install` first in the 'VCAndRCTBridgeLeakDemo' directory.


