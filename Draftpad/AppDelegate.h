//
//  AppDelegate.h
//  Draftpad
//
//  Created by Bruno Fernandes on 13/01/14.
//  Copyright (c) 2014 Paper Street Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

@interface DPAAlbum : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *artist;
@property (nonatomic, strong) NSString *tracks;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *url;

@end
