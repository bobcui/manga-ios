//
//  MangaBrief.h
//  manga-ios
//
//  Created by bob on 15/9/2.
//  Copyright (c) 2015年 EverManga Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MangaBrief : NSObject

@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *ranking;
@property (nonatomic, readonly) NSString *slug;
@property (nonatomic, readonly) NSString *coverImageUrl;

@end
