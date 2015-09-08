//
//  MangaCollectionViewCell.h
//  manga-ios
//
//  Created by bob on 15/8/28.
//  Copyright (c) 2015年 EverManga Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Manga;

@interface MangaCollectionViewCell : UICollectionViewCell

@property (nonatomic) Manga * manga;
@property IBOutlet UIImageView * mangaCoverImageView;

@end
