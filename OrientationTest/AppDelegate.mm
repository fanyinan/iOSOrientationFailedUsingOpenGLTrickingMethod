//
//  AppDelegate.m
//  OrientationTest
//
//  Created by 范祎楠 on 2022/9/20.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
    ViewController* pViewController  = [[ViewController alloc] init];
    _window.rootViewController = pViewController;
    [_window makeKeyAndVisible];
    
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskAll;
}

@end
