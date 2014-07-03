//
//  TestPageViewController.m
//  pageview-in-tableview
//
//  Created by DEVFLOATER38-XL on 2014-07-03.
//  Copyright (c) 2014 dc. All rights reserved.
//

#import "TestPageViewController.h"
#import "TestViewController.h"

@interface TestPageViewController () <UIPageViewControllerDataSource>

@property (nonatomic, strong) NSMutableArray *controllerDataSource;

@end

@implementation TestPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataSource = self;
    
    self.controllerDataSource = [NSMutableArray array];
    for (NSInteger x = 1; x <= 10; x++) {
        TestViewController *controller = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([TestViewController class])];
        [controller setIndex:x];
        
        [self.controllerDataSource addObject:controller];
    }
    
    [self setViewControllers:@[self.controllerDataSource[0]]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO
                  completion:nil];
}

#pragma mark - <UIPageViewControllerDelegate>

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if (viewController == [self.controllerDataSource lastObject]) {
        return nil;
    }
    
    return self.controllerDataSource[[self.controllerDataSource indexOfObject:viewController] + 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if (viewController == [self.controllerDataSource firstObject]) {
        return nil;
    }
    
    return self.controllerDataSource[[self.controllerDataSource indexOfObject:viewController] - 1];
}

@end
