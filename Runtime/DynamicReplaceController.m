//
//  DynamicReplaceController.m
//  Runtime
//
//  Created by patpat on 2017/3/28.
//  Copyright © 2017年 test. All rights reserved.
//

#import "DynamicReplaceController.h"
#import <objc/runtime.h>

@interface DynamicReplaceController ()
@property (nonatomic,strong) UIButton* replaceBtn;

@end

@implementation DynamicReplaceController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.replaceBtn];
    Method m1 = class_getInstanceMethod([Person class], @selector(tellName));
    Method m2 = class_getInstanceMethod([Tool class], @selector(changeMethod));
    method_exchangeImplementations(m1, m2);

}

-(UIButton *)replaceBtn
{
    if (!_replaceBtn) {
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"sayName" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        btn.frame = CGRectMake(50, 100, 100, 100);
        [btn addTarget:self action:@selector(replaceMethod:) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor blueColor];
        _replaceBtn = btn;
    }
    return _replaceBtn;
}

- (void)replaceMethod:(id)sender
{
    NSLog(@"%@",[self.person tellName]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
