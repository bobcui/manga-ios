//
//  CatalogViewController.m
//  manga-ios
//
//  Created by bob on 15/8/31.
//  Copyright (c) 2015年 EverManga Studio. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "CatalogViewController.h"
#import "MangaCollectionViewCell.h"

@interface CatalogViewController ()

@property (nonatomic, weak) IBOutlet UICollectionView * mangaCollectionView;
@property (nonatomic) NSMutableArray * mangas;

@end

@implementation CatalogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (void)loadMangas {
    RKObjectManager *objectManager = [RKObjectManager sharedManager];
    [objectManager
     getObjectsAtPath: @"mangas"
     parameters: nil
     success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
         self.mangas = [mappingResult array];
         if(self.isViewLoaded) {
             [self.mangaCollectionView reloadData];
         }
     }
     failure:^(RKObjectRequestOperation *operation, NSError *error) {
         NSLog(@"Failed with error: %@", [error localizedDescription]);
     }];
}

@end
