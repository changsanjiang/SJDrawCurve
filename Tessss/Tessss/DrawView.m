//
//  DrawView.m
//  Tessss
//
//  Created by BlueDancer on 2017/11/1.
//  Copyright © 2017年 lanwuzhe. All rights reserved.
//

#import "DrawView.h"


#define DRAW_MAX        (15)
#define DRAW_WIDTH      (8)

@interface DrawView ()

@property (nonatomic, assign, readwrite) CGPoint touchPoint;
@property (nonatomic, strong, readonly) NSMutableArray<UIBezierPath *> *bezierPathsM;

@end

@implementation DrawView

@synthesize bezierPathsM = _bezierPathsM;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if ( !self ) return nil;
    _bezierPathsM = [NSMutableArray new];
    return self;
}

- (void)setTouchPoint:(CGPoint)point {

    CGPoint oldPoint = _touchPoint;
    CGPoint newPoint = point;
    _touchPoint = point;
    
    if ( oldPoint.x == 0 && oldPoint.y == 0 ) return;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:oldPoint];
    [bezierPath addLineToPoint:newPoint];
    
    [_bezierPathsM addObject:bezierPath];
    if ( _bezierPathsM.count >= DRAW_MAX ) [_bezierPathsM removeObjectAtIndex:0];

    [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.touchPoint = [touches.anyObject  locationInView:self];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.touchPoint = [touches.anyObject  locationInView:self];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _touchPoint = CGPointMake(0, 0);
    [_bezierPathsM removeAllObjects];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [[UIColor redColor] set];
    [_bezierPathsM enumerateObjectsUsingBlock:^(UIBezierPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.lineWidth = DRAW_WIDTH * idx * 1.0 / DRAW_MAX;
        [obj stroke];
    }];
}

@end
