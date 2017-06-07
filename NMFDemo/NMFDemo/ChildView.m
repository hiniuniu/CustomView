//
//  ChildView.m
//  NMFDemo
//
//  Created by Meng Fan on 2017/6/7.
//  Copyright © 2017年 Haowan. All rights reserved.
//

#import "ChildView.h"

#define kATTR_VIEW_HEIGHT (kHeight-215)
///******* 屏幕尺寸 *******/
#define     kWidth      [UIScreen mainScreen].bounds.size.width
#define     kHeight     [UIScreen mainScreen].bounds.size.height

@interface ChildView () <UIGestureRecognizerDelegate>

@property (nonatomic, weak) UIView *contentView;

@end

@implementation ChildView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

#pragma mark - setupViews
/**
 *  设置视图的基本内容
 */
- (void)setupViews {
    // 添加手势，点击背景视图消失
    UITapGestureRecognizer *tapBackGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeView)];
    tapBackGesture.delegate = self;
    [self addGestureRecognizer:tapBackGesture];
    
    
    UIView *contentView = [[UIView alloc] initWithFrame:(CGRect){0, kHeight - kATTR_VIEW_HEIGHT, kWidth, kATTR_VIEW_HEIGHT}];
    contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:contentView];
    self.contentView = contentView;
}

#pragma mark - UIGestureRecognizerDelegate
//确定点击范围
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    if ([touch.view isDescendantOfView:self.contentView]) {
        return NO;
    }
    return YES;
}


#pragma mark - public
/**
 *  显示属性选择视图
 *
 *  @param view 要在哪个视图中显示
 */
- (void)showInView:(UIView *)view {
    [view addSubview:self];
    __weak typeof(self) _weakSelf = self;
    self.contentView.frame = CGRectMake(0, kHeight, kWidth, kATTR_VIEW_HEIGHT);;
    
    [UIView animateWithDuration:0.3 animations:^{
        _weakSelf.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        _weakSelf.contentView.frame = CGRectMake(0, kHeight - kATTR_VIEW_HEIGHT, kWidth, kATTR_VIEW_HEIGHT);
    }];
}

/**
 *  属性视图的消失
 */
- (void)removeView {
    __weak typeof(self) _weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        _weakSelf.backgroundColor = [UIColor clearColor];
        _weakSelf.contentView.frame = CGRectMake(0, kHeight, kWidth, kATTR_VIEW_HEIGHT);
    } completion:^(BOOL finished) {
        [_weakSelf removeFromSuperview];
    }];
}


@end
