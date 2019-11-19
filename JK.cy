
//IIFE 匿名函数自执行表达式

(function(exports){


APPID = [NSBundle mainBundle].bundleIdentifier,
APPPATH = [NSBundle mainBundle].bundlePath,

//如果有变化,就用function去定义!!
JKRootvc = function(){
    return UIApp.keyWindow.rootViewController;
};


JKKeyWindow = function(){
    return UIApp.keyWindow;
};


//当前类打印
JKCurrentVC = function(){
    return JKGetCurrentVCFromRootVc(JKRootvc());
};

//某个View层次|这个好像有点问题
JKView = function(View) {
    return [View recursiveDescription].toString();
}

//当前控制器View层次
JKCurrentView = function() {
    return JKView(JKCurrentVC().view);
}

JKGetCurrentVCFromRootVc = function(rootVC){
    var currentVC;
    if([rootVC presentedViewController]){
        rootVC = [rootVC presentedViewController];
    }

    if([rootVC isKindOfClass:[UITabBarController class]]){
        currentVC = JKGetCurrentVCFromRootVc(rootVC.selectedViewController);
    }else if([rootVC isKindOfClass:[UINavigationController class]]){
        currentVC = JKGetCurrentVCFromRootVc(rootVC.visibleViewController);
    }else{
        currentVC = rootVC;
    }

    return currentVC;
};


})(exports);

