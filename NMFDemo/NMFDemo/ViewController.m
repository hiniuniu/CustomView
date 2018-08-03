//
//  ViewController.m
//  NMFDemo
//
//  Created by Meng Fan on 2017/6/7.
//  Copyright © 2017年 Haowan. All rights reserved.
//

#import "ViewController.h"
#import "ChildView.h"
#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUI];
}

- (void)setUI {
    CustomView *customView = [[CustomView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 100)];
    customView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:customView];
    
    __weak typeof(self) weakSelf = self;
    customView.clickCustomButtomBlock = ^{
        NSLog(@"hahahha");
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf showChildView];
    };
}


- (IBAction)buttonAction:(id)sender {
    [self showChildView];
}

- (void)showChildView {
    ChildView *selectView = [[ChildView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //显示
    [selectView showInView:self.navigationController.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
