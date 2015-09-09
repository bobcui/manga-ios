//
//  MangaCollectionViewCell.m
//  manga-ios
//
//  Created by bob on 15/8/28.
//  Copyright (c) 2015年 EverManga Studio. All rights reserved.
//

#import <DFImageManager/DFImageManagerKit.h>
#import "MangaCollectionViewCell.h"
#import "MangaBrief.h"


@interface MangaCollectionViewCell ()

@property (nonatomic, weak) IBOutlet DFImageView *coverImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *authorLabel;

@end


@implementation MangaCollectionViewCell

@synthesize manga = _manga;

- (void)setManga:(MangaBrief *)manga {
    _manga = manga;

    [_coverImageView prepareForReuse];
    [_coverImageView setImageWithResource:[NSURL URLWithString:_manga.coverImageUrl]];
    
    _nameLabel.text = _manga.name;
}

@end
