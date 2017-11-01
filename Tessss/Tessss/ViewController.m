//
//  ViewController.m
//  Tessss
//
//  Created by BlueDancer on 2017/11/1.
//  Copyright © 2017年 lanwuzhe. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@property (nonatomic, strong) DrawView *ssssView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.ssssView];
    self.ssssView.backgroundColor = [UIColor whiteColor];
    self.ssssView.frame = self.view.bounds;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (DrawView *)ssssView  {
    if ( _ssssView ) return _ssssView;
    _ssssView = [DrawView new];
    return _ssssView;
}

//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    CGPoint loc = [touches.anyObject  locationInView:self.view];
//    UIView *beforeView = self.view.subviews.lastObject;
//    UIView *view = [self createViewWithPoint:loc];
//    [self.view addSubview:view];
//
//    [UIView animateWithDuration:0.25 animations:^{
//        beforeView.transform = CGAffineTransformMakeTranslation(loc.x, loc.y);
//    } completion:^(BOOL finished) {
//        [beforeView removeFromSuperview];
//    }];
//}
//
//- (UIView *)createViewWithPoint:(CGPoint)point {
//    UIView *view  = [UIView new];
//    view.frame = CGRectMake(point.x, point.y, 5, 5);
//    view.backgroundColor = [UIColor colorWithRed:1.0 * (arc4random() % 256 / 255.0)
//                                           green:1.0 * (arc4random() % 256 / 255.0)
//                                            blue:1.0 * (arc4random() % 256 / 255.0)
//                                           alpha:1];
//    return view;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
