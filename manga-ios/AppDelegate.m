//
//  AppDelegate.m
//  manga-ios
//
//  Created by bob on 15/9/1.
//  Copyright (c) 2015年 EverManga Studio. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "MangaBrief.h"
#import "MangaConfig.h"
#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong, nonatomic) UIView *launchView;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;

    NSURL *baseUrl = [NSURL URLWithString:@"http://api.mangabull.com/v1/"];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseUrl];
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];

    // configs mapping
    RKObjectMapping *mangaConfigMapping = [RKObjectMapping mappingForClass:[MangaConfig class]];
    [mangaConfigMapping addAttributeMappingsFromDictionary:
     @{
        @"cover_url"        : @"coverUrl",
        @"chapter_page_url" : @"chapterPageUrl"
       }];
    [objectManager addResponseDescriptor:
     [RKResponseDescriptor
        responseDescriptorWithMapping: mangaConfigMapping
        method: RKRequestMethodGET
        pathPattern: @"configs"
        keyPath: nil
        statusCodes: [NSIndexSet indexSetWithIndex:200]
      ]];
    
    // mangas mapping
    RKObjectMapping *mangaBriefMapping = [RKObjectMapping mappingForClass:[MangaBrief class]];
    [mangaBriefMapping addAttributeMappingsFromDictionary:
     @{
       @"id"    : @"id",
       @"nme"   : @"name",
       @"slg"   : @"slug",
       @"rnk"   : @"ranking"
       }];
    [objectManager addResponseDescriptor:
     [RKResponseDescriptor
      responseDescriptorWithMapping: mangaBriefMapping
      method: RKRequestMethodGET
      pathPattern: @"mangas"
      keyPath: nil
      statusCodes: [NSIndexSet indexSetWithIndex:200]
      ]];
    
    self.launchView = [[NSBundle mainBundle ]loadNibNamed:@"LaunchScreen" owner:nil options:nil][0];
    self.launchView.frame = CGRectMake(0, 0, self.window.screen.bounds.size.width, self.window.screen.bounds.size.height);
    [self.window makeKeyAndVisible];
    [self.window addSubview:self.launchView];
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(removeLaunchView) userInfo:nil repeats:NO];
    
    return YES;
}

-(void)removeLaunchView
{
    [self.launchView removeFromSuperview];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
