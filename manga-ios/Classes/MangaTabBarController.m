//
//  TabBarController.m
//  manga-ios
//
//  Created by bob on 15/9/8.
//  Copyright (c) 2015年 EverManga Studio. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "MangaTabBarController.h"
#import "MangaConfig.h"
#import "CatalogViewController.h"

@interface MangaTabBarController ()

@property (nonatomic) BOOL isConfigLoaded;
@property (nonatomic) BOOL isCategoryLoaded;

@end

@implementation MangaTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)isDataLoaded {
    return self.isConfigLoaded && self.isCategoryLoaded;
}

- (void)loadData {
    [self loadCategory];
    [self loadConfig];
}

- (void)loadConfig {
    RKObjectManager *objectManager = [RKObjectManager sharedManager];
    [objectManager
     getObjectsAtPath: @"configs"
     parameters: nil
     success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
         [MangaConfig sharedInstance:[mappingResult firstObject]];
         self.isConfigLoaded = true;
         [self next];
     }
     failure:^(RKObjectRequestOperation *operation, NSError *error) {
         NSLog(@"Failed with error: %@", [error localizedDescription]);
     }];
}

- (void)loadCategory {
    self.isCategoryLoaded = true;
}

- (void)next {
    if ([self isDataLoaded] == true) {
        if ([self.selectedViewController isKindOfClass:[CatalogViewController class]]) {
            [(CatalogViewController *)self.selectedViewController loadMangas];
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
