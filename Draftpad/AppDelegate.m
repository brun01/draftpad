//
//  AppDelegate.m
//  Draftpad
//
//  Created by Bruno Fernandes on 13/01/14.
//  Copyright (c) 2014 Paper Street Apps. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
   NSString *filename = @"nin_top_albums.json";
    
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:nil];
    NSData *file = [[NSData alloc] initWithContentsOfFile:path];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:file
                                                               options:0
                                                                 error:nil];
    NSLog(@"%@",dictionary);
    return YES;
}


@end
