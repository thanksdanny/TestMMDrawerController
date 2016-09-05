//
//  AppDelegate.m
//  TestMMDreawerController
//
//  Created by Danny Ho on 9/5/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "AppDelegate.h"

#import "LeftViewController.h"
#import "RightViewController.h"
#import <MMDrawerController.h>
#import "NavigationVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 床架窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 创建左侧控制器
    LeftViewController *leftVC = [LeftViewController new];
    
    // 创建右侧控制器
    RightViewController *rightVC = [RightViewController new];
    
    // 创建中间侧控制器
    MMDrawerController *drawerVC = [[MMDrawerController alloc] initWithCenterViewController:rightVC leftDrawerViewController:leftVC];
    
    // 开启侧滑
    [drawerVC setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    
    // 关闭侧滑
    [drawerVC setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    // 创建导航控制器 并将drawer控制器设为根控制器
    NavigationVC *nav = [[NavigationVC alloc] initWithRootViewController:drawerVC];
    
    // 将导航控制器设为window的根控制器
    self.window.rootViewController = nav;
    
    // 显示
    [self.window makeKeyAndVisible];


    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
