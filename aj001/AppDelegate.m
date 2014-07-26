//
//  AppDelegate.m
//  aj001
//
//  Created by anjun on 14-7-26.
//  Copyright (c) 2014年 anjun. All rights reserved.
//

#import "AppDelegate.h"
#import "model/CameraEngine.h"
#import "ViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[CameraEngine engine] startup];
    [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(stop:) userInfo:nil repeats:YES];
    return YES;
}
-(void)stop:(NSTimer*)t{
    [[CameraEngine engine] stopCapture];
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[CameraEngine engine] stopCapture];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[CameraEngine engine] startup];
    ViewController* view = (ViewController*) self.window.rootViewController;
    [view startPreview];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
