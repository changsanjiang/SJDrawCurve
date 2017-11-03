//
//  ViewController.m
//  Tessss
//
//  Created by BlueDancer on 2017/11/1.
//  Copyright © 2017年 lanwuzhe. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()<DrawViewDelegate>

@property (nonatomic, strong) DrawView *ssssView;

@property (nonatomic, strong) DrawView *tmpView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ssssView = [DrawView new];
    [self.view addSubview:self.ssssView];
    self.ssssView.backgroundColor = [UIColor whiteColor];
    self.ssssView.frame = CGRectMake(0, 0, self.view.frame.size.width * 0.5, self.view.frame.size.height);
    self.ssssView.delegate = self;
    
    
    self.tmpView = [DrawView new];
    [self.view addSubview:self.tmpView];
    self.tmpView.backgroundColor = [UIColor grayColor];
    self.tmpView.frame = CGRectMake(self.view.frame.size.width * 0.5, 0, self.view.frame.size.width * 0.5, self.view.frame.size.height);
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchBegin:(DrawView *)view touchPoint:(CGPoint)point {
    [self.tmpView trackPoint:point];
}

- (void)toucheMoved:(DrawView *)view touchPoint:(CGPoint)point {
    [self.tmpView trackPoint:point];
}

- (void)touchEnded:(DrawView *)view {
    [self.tmpView trackClear];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
