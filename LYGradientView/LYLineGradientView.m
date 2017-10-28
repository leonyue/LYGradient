//
//  LYLineGradientView.m
//  LYGradientView
//
//  Created by 得建岳 on 2017/8/27.
//  Copyright © 2017年 得建岳. All rights reserved.
//

#import "LYLineGradientView.h"

@implementation LYLinearGradientView

- (void)drawRect:(CGRect)rect {
    CGGradientRef gradientRef;
    CGColorSpaceRef colorSpaceRef;
    CGFloat locs[3] = {0,0.5,1};
    
    colorSpaceRef = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
    
    UIColor *a = self.a?:[UIColor redColor];
    UIColor *b = self.b?:[UIColor greenColor];
    UIColor *c = self.c?:[UIColor blueColor];
    
    NSArray* colors_new = @[(id)a.CGColor,
                            (id)b.CGColor,
                            (id)c.CGColor]
    ;
    
    gradientRef = CGGradientCreateWithColors(colorSpaceRef, (CFArrayRef)colors_new, locs);
    //    gradientRef = CGGradientCreateWithColorComponents (colorSpaceRef, colors, locs, 3);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextDrawLinearGradient(contextRef, gradientRef, CGPointZero, CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect)), 0);
    
    CGColorSpaceRelease(colorSpaceRef);
    CGGradientRelease(gradientRef);
    
    
}

@end
