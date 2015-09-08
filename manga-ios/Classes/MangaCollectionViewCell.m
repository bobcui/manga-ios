//
//  MangaCollectionViewCell.m
//  manga-ios
//
//  Created by bob on 15/8/28.
//  Copyright (c) 2015年 EverManga Studio. All rights reserved.
//

#import "MangaCollectionViewCell.h"
#import "MangaBrief.h"


@interface MangaCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView * coverImageView;
@property (nonatomic, weak) IBOutlet UILabel * nameLabel;
@property (nonatomic, weak) IBOutlet UILabel * authorLabel;

@end


@implementation MangaCollectionViewCell

@synthesize manga = _manga;

- (void)setManga:(MangaBrief *)manga {
    if (_manga) {
        return;
    }
    
    _manga = manga;
    
    self.coverImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_manga.coverImageUrl]]];
    self.nameLabel.text = _manga.name;
}

@end
