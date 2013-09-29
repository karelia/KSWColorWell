//
//  KSWColorWell.m
//
//  Created by Mike on 28/09/2013.
//  Copyright (c) 2013 Karelia Software. All rights reserved.
//

#import "KSWColorWell.h"

@implementation KSWColorWell

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupLayer];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder;
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setupLayer];
    }
    return self;
}

#pragma mark Color

- (UIColor *)color;
{
    return [UIColor colorWithCGColor:self.shapeLayer.fillColor];
}

- (void)setColor:(UIColor *)color;
{
    BOOL needsUpdate = (color == nil || self.color == nil);
    self.shapeLayer.fillColor = color.CGColor;
    if (needsUpdate) [self updatePath];
}

#pragma mark Layer

- (CAShapeLayer *)shapeLayer; { return (CAShapeLayer *)self.layer; }
+ (Class)layerClass; { return [CAShapeLayer class]; }

- (void)setupLayer;
{
    CAShapeLayer *layer = self.shapeLayer;
    layer.strokeColor = [UIColor darkGrayColor].CGColor;
    layer.lineWidth = 1;
    [self updatePath];
}

- (void)updatePath;
{
    CAShapeLayer *layer = self.shapeLayer;
    CGPathRef path = NULL;
    
    if (self.color)
    {
        CGFloat inset = layer.lineWidth / 2;
        CGRect rect = CGRectInset(self.bounds, inset, inset);
        
        path = CGPathCreateWithRoundedRect(rect,
                                           5, 5,  // seems about right
                                           NULL);
    }
    
    layer.path = path;
    CGPathRelease(path);
}

- (void)setBounds:(CGRect)bounds;
{
    [super setBounds:bounds];
    [self updatePath];
}

@end
