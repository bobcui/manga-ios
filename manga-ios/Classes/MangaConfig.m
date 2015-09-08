//
//  MangaConfig.m
//  manga-ios
//
//  Created by bob on 15/9/2.
//  Copyright (c) 2015年 EverManga Studio. All rights reserved.
//

#import "MangaConfig.h"

@implementation MangaConfig

static  MangaConfig *instance = nil;

+ (MangaConfig *)sharedInstance {
    return instance;
}

+ (void)sharedInstance:(MangaConfig *)instance_ {
    instance = instance_;
}

@end
