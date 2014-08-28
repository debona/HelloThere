//
//  _FeedViewController.m
//  HelloThere
//
//  Created by Thomas DE BONA on 27/08/2014.
//  Copyright (c) 2014 debona. All rights reserved.
//

#import "_FeedViewController.h"

#import "_TextMessageCell.h"
#import "_Place.h"


static NSString * const TextMessageCellIdentifier = @"TextMessageCellIdentifier";

@interface _FeedViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *messages;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation _FeedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.messages = [@[
                        @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi rutrum consectetur justo, sed vehicula justo gravida id. Suspendisse a maximus elit. Proin sagittis risus lectus, quis tristique felis vestibulum id.",
                        @"Curabitur sed lobortis ante.",
                        @"Nullam posuere pulvinar justo, vitae sollicitudin leo ultrices ut.",
                        @"Curabitur a quam urna.",
                        @"Vivamus ultricies accumsan vulputate. Suspendisse potenti. Nullam pharetra metus orci, eget interdum diam viverra ut. Nulla dapibus mattis metus a consequat.",
                        @"Morbi sed dui felis.",
                        @"Cras condimentum condimentum felis. Fusce vitae finibus ipsum.",
                        @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi rutrum consectetur justo, sed vehicula justo gravida id. Suspendisse a maximus elit. Proin sagittis risus lectus, quis tristique felis vestibulum id.",
                        @"Curabitur sed lobortis ante.",
                        @"Nullam posuere pulvinar justo, vitae sollicitudin leo ultrices ut.",
                        @"Curabitur a quam urna.",
                        @"Vivamus ultricies accumsan vulputate. Suspendisse potenti. Nullam pharetra metus orci, eget interdum diam viverra ut. Nulla dapibus mattis metus a consequat.",
                        @"Morbi sed dui felis.",
                        @"Cras condimentum condimentum felis. Fusce vitae finibus ipsum.",
                        @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi rutrum consectetur justo, sed vehicula justo gravida id. Suspendisse a maximus elit. Proin sagittis risus lectus, quis tristique felis vestibulum id.",
                        @"Curabitur sed lobortis ante.",
                        @"Nullam posuere pulvinar justo, vitae sollicitudin leo ultrices ut.",
                        @"Curabitur a quam urna.",
                        @"Vivamus ultricies accumsan vulputate. Suspendisse potenti. Nullam pharetra metus orci, eget interdum diam viverra ut. Nulla dapibus mattis metus a consequat.",
                        @"Morbi sed dui felis.",
                        @"Cras condimentum condimentum felis. Fusce vitae finibus ipsum.",
                      ] mutableCopy];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"_TextMessageCell" bundle:nil] forCellReuseIdentifier:TextMessageCellIdentifier];
    
    self.nameLabel.text = self.place.name;
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
    return [self.messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self textCellAtIndexPath:indexPath];
}

- (_TextMessageCell *)textCellAtIndexPath:(NSIndexPath *)indexPath {
  _TextMessageCell *cell = [self.tableView dequeueReusableCellWithIdentifier:TextMessageCellIdentifier forIndexPath:indexPath];
  [self configureTextCell:cell atIndexPath:indexPath];
  return cell;
}

- (void)configureTextCell:(_TextMessageCell *)cell atIndexPath:(NSIndexPath *)indexPath {
  cell.messageLabel.text = [self.messages objectAtIndex:[indexPath row]];
  cell.dateLabel.text = @"3m ago";
  cell.usernameLabel.text = @"debona";
}

//////////////////////////////////

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return [self heightForTextCellAtIndexPath:indexPath];
}

- (CGFloat)heightForTextCellAtIndexPath:(NSIndexPath *)indexPath {
  static _TextMessageCell *sizingCell = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sizingCell = [self.tableView dequeueReusableCellWithIdentifier:TextMessageCellIdentifier];
  });

  [self configureTextCell:sizingCell atIndexPath:indexPath];
  return [self calculateHeightForConfiguredSizingCell:sizingCell];
}

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];

    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}


#pragma mark - UITableViewDelegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
