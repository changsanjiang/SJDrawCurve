//
//  DrawView.m
//  Tessss
//
//  Created by BlueDancer on 2017/11/1.
//  Copyright © 2017年 lanwuzhe. All rights reserved.
//

#import "DrawView.h"


#define DRAW_MAX        (15)

@interface DrawView ()

@property (nonatomic, assign, readwrite) CGPoint touchPoint;
@property (nonatomic, assign, readwrite) CGPoint trackPoint;
@property (nonatomic, strong, readonly) NSMutableArray<UIBezierPath *> *bezierPathsM;
@property (nonatomic, strong, readonly) NSMutableArray<UIBezierPath *> *trackBezierPathsM;

@end

@implementation DrawView

@synthesize bezierPathsM = _bezierPathsM;
@synthesize trackBezierPathsM = _trackBezierPathsM;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if ( !self ) return nil;
    _trackBezierPathsM = [NSMutableArray new];
    _bezierPathsM = [NSMutableArray new];
    _touchColor = [UIColor redColor];
    _trackColor = [UIColor greenColor];
    _touchLine_MAXW = 8;
    _trackLine_MAXW = 8;
    return self;
}

- (void)setTouchPoint:(CGPoint)point {

    CGPoint oldPoint = _touchPoint;
    CGPoint newPoint = point;
    _touchPoint = point;
    
    if ( oldPoint.x == 0 && oldPoint.y == 0 ) return;
    if ( newPoint.x == 0 && newPoint.x == 0 ) return;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:oldPoint];
    [bezierPath addLineToPoint:newPoint];
    
    [_bezierPathsM addObject:bezierPath];
    if ( _bezierPathsM.count >= DRAW_MAX ) [_bezierPathsM removeObjectAtIndex:0];

    [self setNeedsDisplay];
}

- (void)setTrackPoint:(CGPoint)point {
    CGPoint oldPoint = _trackPoint;
    CGPoint newPoint = point;
    _trackPoint = point;
    
    if ( oldPoint.x == 0 && oldPoint.y == 0 ) return;
    if ( newPoint.x == 0 && newPoint.x == 0 ) return;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:oldPoint];
    [bezierPath addLineToPoint:newPoint];
    
    [_trackBezierPathsM addObject:bezierPath];
    if ( _trackBezierPathsM.count >= DRAW_MAX ) [_trackBezierPathsM removeObjectAtIndex:0];
    
    [self setNeedsDisplay];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.touchPoint = [touches.anyObject  locationInView:self];
    if ( ![self.delegate respondsToSelector:@selector(touchBegin:touchPoint:)] ) return;
    [self.delegate touchBegin:self touchPoint:_touchPoint];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.touchPoint = [touches.anyObject  locationInView:self];
    if ( ![self.delegate respondsToSelector:@selector(toucheMoved:touchPoint:)] ) return;
    [self.delegate toucheMoved:self touchPoint:_touchPoint];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchClear];
    if ( ![self.delegate respondsToSelector:@selector(touchEnded:)] ) return;
    [self.delegate touchEnded:self];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [_touchColor set];
    [_bezierPathsM enumerateObjectsUsingBlock:^(UIBezierPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.lineWidth = _touchLine_MAXW * idx * 1.0 / DRAW_MAX;
        [obj stroke];
    }];
    
    
    [_trackColor set];
    [_trackBezierPathsM enumerateObjectsUsingBlock:^(UIBezierPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.lineWidth = _trackLine_MAXW * idx * 1.0 / DRAW_MAX;
        [obj stroke];
    }];
}

- (void)touchClear {
    self.touchPoint = CGPointMake(0, 0);
    [_bezierPathsM removeAllObjects];
    [self setNeedsDisplay];
}

- (void)trackClear {
    self.trackPoint = CGPointMake(0, 0);
    [_trackBezierPathsM removeAllObjects];
    [self setNeedsDisplay];
}

- (void)trackPoint:(CGPoint)point {
    if ( point.x == 0 && point.y == 0 ) { [self trackClear]; return;}
    self.trackPoint = point;
}

@end
