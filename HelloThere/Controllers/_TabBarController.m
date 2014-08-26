//
//  _TabBarController.m
//  HelloThere
//
//  Created by Thomas DE BONA on 26/08/2014.
//  Copyright (c) 2014 debona. All rights reserved.
//

#import "_TabBarController.h"

#import "_AccountViewController.h"

@interface _TabBarController ()

@end

@implementation _TabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *controllers = @[
                             [[_AccountViewController alloc] initWithDefaultNib],
                             [[UIViewController alloc] init],
                             ];
    ((UIViewController *)(controllers.firstObject)).view.backgroundColor = [UIColor colorWithRed:0.06 green:0.44 blue:0.57 alpha:1];
    self.viewControllers = controllers;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
