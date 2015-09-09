//
//  CatalogNavigationController.m
//  manga-ios
//
//  Created by bob on 15/9/9.
//  Copyright (c) 2015年 EverManga Studio. All rights reserved.
//

#import "CatalogNavigationController.h"
#import "CatalogViewController.h"

@interface CatalogNavigationController ()

@end

@implementation CatalogNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData {
    UIViewController *rootViewController = [self.viewControllers firstObject];
    if ([rootViewController isKindOfClass:[CatalogViewController class]]) {
        [(CatalogViewController *)rootViewController initData];
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
