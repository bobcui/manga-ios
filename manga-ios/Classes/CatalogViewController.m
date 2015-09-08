//
//  CatalogViewController.m
//  manga-ios
//
//  Created by bob on 15/8/31.
//  Copyright (c) 2015年 EverManga Studio. All rights reserved.
//

#import "CatalogViewController.h"
#import "MangaCollectionViewCell.h"
#import "Manga.h"

@interface CatalogViewController ()

@property (nonatomic, weak) IBOutlet UICollectionView * mangaCollectionView;
@property NSMutableArray * mangas;

@end

@implementation CatalogViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if (self.mangas == nil) {
        self.mangas = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < 100; ++i) {
            [self.mangas addObject:[[Manga alloc] init]];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.mangas count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MangaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MangaCollectionViewCell class]) forIndexPath:indexPath];
    
    cell.manga = self.mangas[indexPath.item];
    return cell;
}

@end
