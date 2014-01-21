//
//  DPAAlbum.h
//  Draftpad
//
//  Created by Bruno Fernandes on 21/01/14.
//  Copyright (c) 2014 Paper Street Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPAAlbum : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *artist;
@property (nonatomic, strong) NSString *tracks;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *url;

@end