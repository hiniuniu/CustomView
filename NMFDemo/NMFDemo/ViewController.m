//
//  ViewController.m
//  NMFDemo
//
//  Created by Meng Fan on 2017/6/7.
//  Copyright © 2017年 Haowan. All rights reserved.
//

#import "ViewController.h"
#import "ChildView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)buttonAction:(id)sender {
    
    ChildView *selectView = [[ChildView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //显示
    [selectView showInView:self.navigationController.view];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
