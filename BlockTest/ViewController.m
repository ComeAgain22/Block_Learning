//
//  ViewController.m
//  BlockTest
//
//  Created by MarchWood on 2019/12/16.
//  Copyright © 2019 MarchWood. All rights reserved.
//

#import "ViewController.h"
#import "SecViewController.h"


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createUI];
}

- (void)dealloc
{
    NSLog(@"执行%@释放",[self class]);
}

- (void)createUI {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 100, 50);
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnAction {
    SecViewController *secVC = [SecViewController new];
    [self.navigationController pushViewController:secVC animated:YES];    
}

@end
