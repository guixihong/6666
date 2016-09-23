//
//  AppDelegate.m
//  智能台球
//
//  Created by 孙超 on 16/7/12.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "AppDelegate.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
//    LoginController *vc = [[LoginController alloc]init];
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
//    self.window.rootViewController = nav;
    [self createUI];
//
//    self.myYyCache = [YYCache cacheWithName:@"myCache"];
//    
//    NSLog(@"%@",[self iphoneType]);
    [self getRaisedCache];
    [NSThread sleepForTimeInterval:0.7]; // 设置启动页面停留时间
    

    return YES;
}

-(void)getRaisedCache{

    NSNumber *cacheNumber = [[NSUserDefaults standardUserDefaults] objectForKey:@"CACHESUM"];
    if ([cacheNumber floatValue] > 0) {
        
        _cache = [cacheNumber floatValue];
    }else{
    
        _cache = 0.00;

    }
    NSNumber *newNumber = [NSNumber numberWithFloat:_cache+(arc4random() % 50)/100.0
];
    
    [[NSUserDefaults standardUserDefaults] setObject:newNumber forKey:@"CACHESUM"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)createUI
{
    CustomTabBarViewController *tbvc = [[CustomTabBarViewController alloc]init];
    tbvc.tabBar.tintColor = [UIColor blackColor];
    tbvc.tabBar.translucent = NO;
    [tbvc addViewControllerWithString:@"MainViewController" title:@"主页" andImage:@"tabbar_item_home"  andSlectedImage:@"tabbar_item_home_sel"];
    [tbvc addViewControllerWithString:@"CommentController" title:@"点评" andImage:@"tabbar_item_des"  andSlectedImage:@"tabbar_item_des_sel"];
    [tbvc addViewControllerWithString:@"ComplaintController" title:@"投诉" andImage:@"tabbar_item_my"  andSlectedImage:@"tabbar_item_my_sel"];
    [tbvc addViewControllerWithString:@"PersonalCenterViewController" title:@"我的" andImage:@"tabbar_item_discover"  andSlectedImage:@"tabbar_item_discover_sel"];

    self.window.rootViewController = tbvc;
}


- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}


@end
