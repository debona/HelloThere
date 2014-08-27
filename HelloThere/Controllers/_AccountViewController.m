//
//  _AccountViewController.m
//  HelloThere
//
//  Created by Thomas DE BONA on 27/08/2014.
//  Copyright (c) 2014 debona. All rights reserved.
//

#import "_AccountViewController.h"

#import "UIView+endEditingOnTap.h"

#import "IonIcons.h"

@interface _AccountViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *photo;

@property (weak, nonatomic) IBOutlet UITableViewCell *usernameCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *fullnameCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *colorCell;

@property (weak, nonatomic) IBOutlet UITextField *colorTeaser;

@property (strong, nonatomic) NSArray *cells;

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
    
    self.photo.image = [IonIcons imageWithIcon:icon_ios7_person_outline
                                          iconColor:[UIColor whiteColor]
                                           iconSize:150
                                          imageSize:self.photo.frame.size];
    self.cells = @[
                   self.usernameCell,
                   self.fullnameCell,
                   self.colorCell,
                   ];

    [self.view endEditingOnTap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cells count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.cells objectAtIndex:indexPath.row];
}

@end
