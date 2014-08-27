//
//  _TabBarController.m
//  HelloThere
//
//  Created by Thomas DE BONA on 26/08/2014.
//  Copyright (c) 2014 debona. All rights reserved.
//

#import "_TabBarController.h"

#import "_AccountViewController.h"
#import "_DiscoverViewController.h"
#import "IonIcons.h"

@interface _TabBarController ()

@end

@implementation _TabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSArray *tabs = @[
                      @{
                          @"controller": [[_AccountViewController alloc] initWithDefaultNib],
                          @"title": @"Me",
                          @"tabBarTitle": @"Me",
                          @"tabBarImage": [IonIcons imageWithIcon:icon_ios7_person_outline
                                                             iconColor:[UIColor whiteColor]
                                                              iconSize:46
                                                             imageSize:CGSizeMake(40, 40)],
                       },
                      @{
                          @"controller": [[_DiscoverViewController alloc] initWithDefaultNib],
                          @"title": @"Discover",
                          @"tabBarTitle": @"Discover",
                          @"tabBarImage": [IonIcons imageWithIcon:icon_ios7_world_outline
                                                             iconColor:[UIColor whiteColor]
                                                              iconSize:40
                                                             imageSize:CGSizeMake(40, 40)],
                        },
                     ];

    NSMutableArray *controllers = [[NSMutableArray alloc] init];

    for (NSDictionary *tab in tabs) {
        UIViewController *controller = [tab objectForKey:@"controller"];
        [controllers addObject:[[UINavigationController alloc] initWithRootViewController:controller]];
        
        controller.title = [tab objectForKey:@"title"];
        
        controller.tabBarItem.title = [tab objectForKey:@"tabBarTitle"];
        controller.tabBarItem.image = [tab objectForKey:@"tabBarImage"];
    }
    
    self.viewControllers = controllers;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
