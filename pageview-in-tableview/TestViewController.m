//
//  TestViewController.m
//  pageview-in-tableview
//
//  Created by DEVFLOATER38-XL on 2014-07-03.
//  Copyright (c) 2014 dc. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@property (weak, nonatomic) IBOutlet UILabel *indexLabel;

@end

@implementation TestViewController

- (void)awakeFromNib {
    self.view.backgroundColor = [UIColor randomColour];
}

- (void)setIndex:(NSUInteger)index {
    self.indexLabel.text = [NSString stringWithFormat:@"%i", index];
}

@end
