//
//  MangaBrief.m
//  manga-ios
//
//  Created by bob on 15/9/2.
//  Copyright (c) 2015年 EverManga Studio. All rights reserved.
//

#import "MangaBrief.h"
#import "MangaConfig.h"

@implementation MangaBrief

- (NSString *)coverImageUrl {
    return [[MangaConfig sharedInstance].coverUrl stringByReplacingOccurrencesOfString:@"{manga-slug}" withString:_slug];
}

@end
