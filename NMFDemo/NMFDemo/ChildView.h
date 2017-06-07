//
//  ChildView.h
//  NMFDemo
//
//  Created by Meng Fan on 2017/6/7.
//  Copyright © 2017年 Haowan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChildView : UIView

/**
 *  显示属性选择视图
 *
 *  @param view 要在哪个视图中显示
 */
- (void)showInView:(UIView *)view;

/**
 *  属性视图的消失
 */
- (void)removeView;


@end
