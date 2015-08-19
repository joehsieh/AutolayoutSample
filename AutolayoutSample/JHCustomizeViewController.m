//
//  JHCustomizeViewController.m
//  AutolayoutSample
//
//  Created by joehsieh on 2015/8/19.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import "JHCustomizeViewController.h"

@interface JHCustomizeView : UIView
@end

@interface JHCustomizeView ()
@property (nonatomic, strong) UIView *leftTopView;
@property (nonatomic, strong) UIView *rightTopView;
@property (nonatomic, strong) UIView *bottomView;
@end

@implementation JHCustomizeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *leftTopView = [[UIView alloc] init];
        self.leftTopView = leftTopView;
        [self addSubview:leftTopView];
        leftTopView.backgroundColor = [UIColor greenColor];
        
        UIView *rightTopView = [[UIView alloc] init];
        self.rightTopView = rightTopView;
        [self addSubview:rightTopView];
        rightTopView.backgroundColor = [UIColor blueColor];
        
        UIView *bottomView = [[UIView alloc] init];
        self.bottomView = bottomView;
        [self addSubview:bottomView];
        bottomView.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //There is a 20-point vertical padding between the two views on top and the one at the bottom (the pin vertical spacing).
    
    //There is a 20-point margin between the views and the edges of the screen (the top, bottom, leading, and trailing space to superview constraints).
    CGFloat inset = 20.0;
    
    //The top-left and top-right views always have the same width (that was the first pin widths equally command).
    CGFloat widthForUpperViews = floor((CGRectGetWidth(self.frame) - 3 * inset) / 2.0); // inset of left, mid and right
    
    //All the views always have the same height (the pin heights equally command).
    CGFloat heightForAllViews = floor((CGRectGetHeight(self.frame) - 3 * inset) / 2.0); // inset of top, mid and bottom
    
    //There is a 20-point horizontal padding between the top-left and top-right views (that was the pin horizontal spacing).
    CGFloat widthForBottomView = CGRectGetWidth(self.frame) - 2 * inset; // inset of left and right
    
    // leftTopView
    CGRect leftTopViewFrame = self.leftTopView.frame;
    leftTopViewFrame.origin.x = inset;
    leftTopViewFrame.origin.y = inset;
    leftTopViewFrame.size.width = widthForUpperViews;
    leftTopViewFrame.size.height = heightForAllViews;
    self.leftTopView.frame = leftTopViewFrame;
    
    // rightTopView
    CGRect rightTopViewFrame = self.rightTopView.frame;
    rightTopViewFrame.origin.x = CGRectGetMaxX(leftTopViewFrame) + inset;
    rightTopViewFrame.origin.y = inset;
    rightTopViewFrame.size.width = widthForUpperViews;
    rightTopViewFrame.size.height = heightForAllViews;
    self.rightTopView.frame = rightTopViewFrame;
    
    // bottomView
    CGRect bottomViewFrame = self.bottomView.frame;
    bottomViewFrame.origin.x = inset;
    bottomViewFrame.origin.y = CGRectGetMaxY(leftTopViewFrame) + inset;
    bottomViewFrame.size.width = widthForBottomView;
    bottomViewFrame.size.height = heightForAllViews;
    self.bottomView.frame = bottomViewFrame;
}
@end

@interface JHCustomizeViewController ()
@property (nonatomic, strong) JHCustomizeView *customizeView;
@end
@implementation JHCustomizeViewController

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    JHCustomizeView *customizeView = [[JHCustomizeView alloc] initWithFrame:self.view.bounds];
    self.customizeView = customizeView;
    [self.view addSubview:customizeView];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.customizeView.frame = self.view.bounds;
}
@end
