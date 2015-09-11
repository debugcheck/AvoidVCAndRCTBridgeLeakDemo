# AvoidPotentialLeakOfVCUsingRN
A demo repository to show potential leaks of VC and bridge leaks using React Native. It's to show the issue [2598](https://github.com/facebook/react-native/issues/2598) of react-native.  

###Problem
The `TwoViewController` won't get deallocated, as well as the `RCTBridge` backing up the `RCTRootView`.  
###Reason
The reason why controllers and bridges won't get deallocated is there is a retain cycle in between.   
![](https://raw.githubusercontent.com/grittymindy/VCAndRCTBridgeLeakDemo/master/ScreenShots/retaincycle.png)
Thanks to @tadeuzagallo to point this out.


###Solution
I tried `[bridge invalidate]` and `[bridge reload]` to break the retain cycle. As @tadeuzagallo suggested, there's another possible way.

###Usage
Run `pod install` first in the 'VCAndRCTBridgeLeakDemo' directory.


