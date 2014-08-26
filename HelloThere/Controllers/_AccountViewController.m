//
//  _AccountViewController.m
//  HelloThere
//
//  Created by Thomas DE BONA on 27/08/2014.
//  Copyright (c) 2014 debona. All rights reserved.
//

#import "_AccountViewController.h"

#import "IonIcons.h"

@interface _AccountViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation _AccountViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBarItem.title = @"Me";
    self.tabBarItem.image = [IonIcons imageWithIcon:icon_ios7_person_outline
                                            iconColor:[UIColor whiteColor]
                                             iconSize:46
                                            imageSize:CGSizeMake(40, 40)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
