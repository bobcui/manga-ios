//
//  MangaCollectionViewCell.m
//  manga-ios
//
//  Created by bob on 15/8/28.
//  Copyright (c) 2015年 EverManga Studio. All rights reserved.
//

#import "MangaCollectionViewCell.h"
#import "Manga.h"

@implementation MangaCollectionViewCell

@synthesize manga = _manga;

- (void)setManga:(Manga *)manga {
    _manga = manga;
    self.mangaCoverImageView.image = [UIImage imageNamed:_manga.cover];
}

@end
