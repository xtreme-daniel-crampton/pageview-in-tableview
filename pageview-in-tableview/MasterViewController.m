//
//  MasterViewController.m
//  pageview-in-tableview
//
//  Created by DEVFLOATER38-XL on 2014-07-03.
//  Copyright (c) 2014 dc. All rights reserved.
//

#import "MasterViewController.h"
#import "TestPageViewController.h"

@interface MasterViewController ()

@property (nonatomic, strong) NSArray *cells;
@property (nonatomic, strong) TestPageViewController *pageViewController;

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cells = @[[UIColor randomColour],
                   [UIColor randomColour],
                   [UIColor randomColour],
                   [UIColor randomColour],
                   [UIColor randomColour],
                   [UIColor randomColour],
                   [UIColor randomColour]
                   ];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cells count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"PageViewControllerCell"];
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            self.pageViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([TestPageViewController class])];
        });
        self.pageViewController.view.frame = cell.contentView.bounds;
        [cell addSubview:self.pageViewController.view];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"NormalCell"];
        cell.backgroundColor = [UIColor randomColour];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 250.0f;
    }
    
    return 65.0f;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
