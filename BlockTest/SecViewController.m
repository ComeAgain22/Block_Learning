//
//  SecViewController.m
//  BlockTest
//
//  Created by MarchWood on 2019/12/17.
//  Copyright © 2019 MarchWood. All rights reserved.
//

#import "SecViewController.h"

typedef void(^myBlock)(SecViewController *);

@interface SecViewController ()

@property (nonatomic, copy) myBlock myblock;
@property (nonatomic, copy) NSString *name;

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    
//    方法一：weak strong dance破解循环
//    __weak typeof(self) weakSelf = self;
//    self.myblock = ^{
//        __strong typeof(self) strongSelf = weakSelf;
//
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//            strongSelf.name = @"小明";
//            NSLog(@"名字:%@",weakSelf.name);
//        });
//    };
    
//    方法二： 合理设nil 破循环链
//    __block SecViewController *myVC = self;
//    self.myblock = ^{
//
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//            myVC.name = @"小明";
//            NSLog(@"名字:%@",myVC.name);
//            myVC = nil;
//        });
//    };
    
//    方法三: 通过传递参数进入block的闭包中，从而实现在闭包中对此对象的调用使用。我们更改一下block带入参数
//    self.myblock = ^(SecViewController *myVC) {
//
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//            myVC.name = @"小明";
//            NSLog(@"名字:%@",myVC.name);
//        });
//    };
//
//    self.myblock(self);
    
    //此处是设计的变量、局部对象
    int a = 10;
    static int b = 100;
    NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"1",@"2", nil];
    
    NSLog(@"a: %p",&a);
    NSLog(@"b: %p",&b);
    NSLog(@"array1: %p",array1);
    
    self.myblock = ^(SecViewController * aa) {
        NSLog(@"a:%d",a);
        NSLog(@"a: %p",&a);
        NSLog(@"b: %d",b);
        NSLog(@"b: %p",&b);
        NSLog(@"array1:%p",array1);
        
    };
    a = 20;
    b = 200;
    [array1 addObject:@"3"];
    self.myblock(self);
}


- (void)dealloc
{
    NSLog(@"执行%@释放",self.class);
}


@end
