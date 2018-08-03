//
//  CustomView.m
//  NMFDemo
//
//  Created by 筑联 on 2018/8/3.
//  Copyright © 2018年 Haowan. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()

@property (nonatomic, strong) UIButton *customButton;

@end

@implementation CustomView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    [self addSubview:self.customButton];
    self.customButton.frame = CGRectMake(20, 25, 200, 50);
}

#pragma mark --action
- (void)buttonAction:(UIButton *)sender {
    NSLog(@"click the customView 中的button");
    
    if (self.clickCustomButtomBlock) {
        self.clickCustomButtomBlock();
    }
}

#pragma mark --lazyLoading
-(UIButton *)customButton {
    if (!_customButton) {
        _customButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_customButton setTitle:@"子视图上的button" forState:UIControlStateNormal];
        [_customButton setBackgroundColor:[UIColor whiteColor]];
        [_customButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_customButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _customButton;
}

@end
