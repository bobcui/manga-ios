//
//  MangaConfig.h
//  manga-ios
//
//  Created by bob on 15/9/2.
//  Copyright (c) 2015年 EverManga Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MangaConfig : NSObject

+ (MangaConfig *)sharedInstance;
+ (void)sharedInstance:(MangaConfig *)instance;

@property (nonatomic, copy) NSString *coverUrl;
@property (nonatomic, copy) NSString *chapterPageUrl;

@end
