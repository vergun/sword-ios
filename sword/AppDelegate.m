//
//  AppDelegate.m
//  sword
//
//  Created by Verdi Ergun on 4/27/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // Set the frame
    CGRect viewRect = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame:viewRect];
    
    // Make the view controller and set key and make visible
//    UIViewController *viewController = [[UIViewController alloc] init];
    self.viewController = [[ViewController alloc] init];
    
    // Make the view
//    UIView *view = [[UIView alloc] initWithFrame:viewRect];
//    view.backgroundColor = [UIColor yellowColor];
//    self.viewController.view = view;
    
    
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    // Log out
    NSLog(@"Application did finish launching with options and is %f tall and %f wide",
          viewRect.size.height,
          viewRect.size.width);
    
    return YES;
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
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end