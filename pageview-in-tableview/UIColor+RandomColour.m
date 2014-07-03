//
//  UIColor+RandomColour.m
//  pageview-in-tableview
//
//  Created by DEVFLOATER38-XL on 2014-07-03.
//  Copyright (c) 2014 dc. All rights reserved.
//

#import "UIColor+RandomColour.h"

@implementation UIColor (RandomColour)

+ (UIColor *)randomColour {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
