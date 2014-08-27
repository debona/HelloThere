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

#import "_User.h"

@interface _AccountViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *photo;

@property (weak, nonatomic) IBOutlet UITableViewCell *usernameCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *fullnameCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *colorCell;


@property (weak, nonatomic) IBOutlet UITextField *usernameLabel;
@property (weak, nonatomic) IBOutlet UITextField *fullnameLabel;
@property (weak, nonatomic) IBOutlet UITextField *colorTeaser;

@property (strong, nonatomic) _User *user;
@property (strong, nonatomic) NSArray *cells;

@end

@implementation _AccountViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    
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
    
    self.user = [_User thomas];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.photo.image = [UIImage imageNamed:self.user.photo];
    self.usernameLabel.text = self.user.username;
    self.fullnameLabel.text = self.user.fullname;
    self.colorTeaser.backgroundColor = self.user.color;
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
