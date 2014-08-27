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

@interface _TabBarController ()

@end

@implementation _TabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *controllers = @[
                             [[_AccountViewController alloc] initWithDefaultNib],
                             [[UINavigationController alloc] initWithRootViewController:[[_DiscoverViewController alloc] initWithDefaultNib]],
                             ];
    
    self.viewControllers = controllers;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
