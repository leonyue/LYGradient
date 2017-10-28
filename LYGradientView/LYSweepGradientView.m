//
//  LYSweepGradientView.m
//  LYGradientViewDemo
//
//  Created by dj.yue on 2017/10/28.
//  Copyright © 2017年 dj.yue. All rights reserved.
//

#import "LYSweepGradientView.h"

@implementation LYSweepGradientView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *fromColor = [UIColor greenColor];
    UIColor *toColor = [UIColor redColor];
    const CGFloat *componetsFrom = CGColorGetComponents(fromColor.CGColor);
    const CGFloat *componentsTo = CGColorGetComponents(toColor.CGColor);
    
    CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    CGFloat radius = 100.f;
    int blockCount = 200;
    
    CGFloat angleFrom = 0;
    CGFloat angleTo = 0;
    
    for (int i = 0 ; i < blockCount; i++) {
        angleTo = angleFrom + (2 * M_PI) / blockCount;
        CGFloat colorComponents[4];
        colorComponents[0] = (componentsTo[0] - componetsFrom[0]) * i / blockCount + componetsFrom[0];
        colorComponents[1] = (componentsTo[1] - componetsFrom[1]) * i / blockCount + componetsFrom[1];
        colorComponents[2] = (componentsTo[2] - componetsFrom[2]) * i / blockCount + componetsFrom[2];
        colorComponents[3] = (componentsTo[3] - componetsFrom[3]) * i / blockCount + componetsFrom[3];
        
        CGContextAddArc(context, center.x, center.y, radius, angleFrom, angleTo, 0);
        CGPoint points[3];
        points[0] = CGPointMake(center.x + cos(angleFrom) * radius, center.y + sin(angleFrom) * radius);
        points[1] = center;
        points[2] = CGPointMake(center.x + cos(angleTo) * radius, center.y + sin(angleTo) * radius);
        CGContextAddLines(context, points, 3);
        CGContextSetFillColor(context, colorComponents);
        CGContextFillPath(context);
        //        CGContextSetStrokeColor(context, colorComponents);
        //        CGContextStrokePath(context);
        angleFrom = angleTo;
    }
}

@end
