//
//  AppDelegate.m
//  TableViewSelectExpand
//
//  Created by khj on 2020/7/31.
//  Copyright © 2020 khj. All rights reserved.
//

#import "AppDelegate.h"
#import "AddFeedbackViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    AddFeedbackViewController *vc = [[AddFeedbackViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    
    return YES;
}




@end
