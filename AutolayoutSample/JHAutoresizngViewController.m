//
//  JHAutoresizngViewController.m
//  AutolayoutSample
//
//  Created by joehsieh on 2015/8/19.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import "JHAutoresizngViewController.h"

@interface JHAutoresizngView : UIView
@end

@interface JHAutoresizngView ()
@property (nonatomic, strong) UIView *leftTopView;
@property (nonatomic, strong) UIView *rightTopView;
@property (nonatomic, strong) UIView *bottomView;
@end

@implementation JHAutoresizngView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat inset = 20.0;
        CGFloat widthForUpperViews = floor((CGRectGetWidth(self.frame) - 3 * inset) / 2.0);
        CGFloat heightForAllViews = floor((CGRectGetHeight(self.frame) - 3 * inset) / 2.0);
        CGFloat widthForBottomView = CGRectGetWidth(self.frame) - 2 * inset;
        
        UIView *leftTopView = [[UIView alloc] initWithFrame:CGRectMake(inset, inset, widthForUpperViews, heightForAllViews)];
        self.leftTopView = leftTopView;
        [self addSubview:leftTopView];
        leftTopView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        leftTopView.backgroundColor = [UIColor greenColor];
        
        UIView *rightTopView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(leftTopView.frame) + inset, inset, widthForUpperViews, heightForAllViews)];
        self.rightTopView = rightTopView;
        [self addSubview:rightTopView];
        rightTopView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        rightTopView.backgroundColor = [UIColor blueColor];
        
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(inset, CGRectGetMaxY(leftTopView.frame) + inset, widthForBottomView, heightForAllViews)];
        self.bottomView = bottomView;
        [self addSubview:bottomView];
        bottomView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin;
        bottomView.backgroundColor = [UIColor orangeColor];
    }
    return self;
}
@end

@interface JHAutoresizngViewController ()
@property (nonatomic, strong) JHAutoresizngView *resizingView;
@end
@implementation JHAutoresizngViewController
- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    JHAutoresizngView *resizingView = [[JHAutoresizngView alloc] initWithFrame:self.view.bounds];
    self.resizingView = resizingView;
    [self.view addSubview:resizingView];
    resizingView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}
@end
