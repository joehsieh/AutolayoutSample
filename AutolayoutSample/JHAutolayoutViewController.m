//
//  JHAutolayoutViewController.m
//  AutolayoutSample
//
//  Created by joehsieh on 2015/8/19.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import "JHAutolayoutViewController.h"

@interface JHAutolayoutView : UIView
@end
@interface JHAutolayoutView ()
@property (nonatomic, strong) UIView *leftTopView;
@property (nonatomic, strong) UIView *rightTopView;
@property (nonatomic, strong) UIView *bottomView;
@end

@implementation JHAutolayoutView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *leftTopView = [[UIView alloc] init];
        self.leftTopView = leftTopView;
        [self addSubview:leftTopView];
        leftTopView.backgroundColor = [UIColor greenColor];
        [leftTopView setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        UIView *rightTopView = [[UIView alloc] init];
        self.rightTopView = rightTopView;
        [self addSubview:rightTopView];
        rightTopView.backgroundColor = [UIColor blueColor];
        [rightTopView setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        UIView *bottomView = [[UIView alloc] init];
        self.bottomView = bottomView;
        [self addSubview:bottomView];
        bottomView.backgroundColor = [UIColor orangeColor];
        [bottomView setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        NSMutableArray *constraints = [NSMutableArray array];
        
        CGFloat inset = 20.0;
        [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:|-%f-[leftTopView(rightTopView)]-%f-[rightTopView(leftTopView)]-%f-|", inset, inset, inset]
                                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                                 metrics:nil
                                                                                   views:NSDictionaryOfVariableBindings(leftTopView,rightTopView)]];
        [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:|-%f-[bottomView]-%f-|", inset, inset]
                                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                                 metrics:nil
                                                                                   views:NSDictionaryOfVariableBindings(bottomView)]];
        [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|-%f-[leftTopView(bottomView)]-%f-[bottomView(leftTopView)]-%f-|", inset, inset, inset]
                                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                                 metrics:nil
                                                                                   views:NSDictionaryOfVariableBindings(leftTopView, bottomView)]];
        [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|-%f-[rightTopView(bottomView)]-%f-[bottomView(rightTopView)]-%f-|", inset, inset, inset]
                                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                                 metrics:nil
                                                                                   views:NSDictionaryOfVariableBindings(rightTopView, bottomView)]];
        [self addConstraints:constraints];
    }
    return self;
}

@end

@interface JHAutolayoutViewController ()
@property (nonatomic, strong) JHAutolayoutView *autolayoutView;
@end
@implementation JHAutolayoutViewController
- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    JHAutolayoutView *autolayoutView = [[JHAutolayoutView alloc] initWithFrame:self.view.bounds];
    self.autolayoutView = autolayoutView;
    [self.view addSubview:autolayoutView];
}
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.autolayoutView.frame = self.view.bounds;
}
@end
