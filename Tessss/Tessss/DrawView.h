//
//  DrawView.h
//  Tessss
//
//  Created by BlueDancer on 2017/11/1.
//  Copyright © 2017年 lanwuzhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DrawViewDelegate;

@interface DrawView : UIView

@property (nonatomic, weak, readwrite) id <DrawViewDelegate> delegate;

- (void)clear;

@end

@protocol DrawViewDelegate<NSObject>

@optional
- (void)touchBegin:(DrawView *)view touchPoint:(CGPoint)point;

- (void)toucheMoved:(DrawView *)view touchPoint:(CGPoint)point;

- (void)touchEnded:(DrawView *)view;

@end
