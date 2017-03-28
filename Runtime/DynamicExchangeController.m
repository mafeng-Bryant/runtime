//
//  DynamicExchangeController.m
//  Runtime
//
//  Created by patpat on 2017/3/28.
//  Copyright © 2017年 test. All rights reserved.
//

#import "DynamicExchangeController.h"
#import <objc/runtime.h>

@interface DynamicExchangeController ()

@property (nonatomic,strong) UIButton* sayNameBtn;
@property (nonatomic,strong) UIButton* saySexBtn;

@end

@implementation DynamicExchangeController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"p = %@",self.person);
    
    [self.view addSubview:self.sayNameBtn];
    [self.view addSubview:self.saySexBtn];
    
    Method m1 = class_getInstanceMethod([self.person class], @selector(tellName));
    
    Method m2 = class_getInstanceMethod([self.person class], @selector(tellSex));
    
    method_exchangeImplementations(m1, m2);


}

-(UIButton *)sayNameBtn
{
    if (!_sayNameBtn) {
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"sayName" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        btn.frame = CGRectMake(50, 100, 100, 100);
        [btn addTarget:self action:@selector(sayNameMethod:) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor blueColor];
        _sayNameBtn = btn;
    }
    return _sayNameBtn;
}

-(UIButton *)saySexBtn
{
    if (!_saySexBtn) {
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"saySex" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        btn.frame = CGRectMake(200, 100, 100, 100);
        [btn addTarget:self action:@selector(saySexMethod:) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor yellowColor];
        _saySexBtn = btn;
    }
    return _saySexBtn;
}

- (void)sayNameMethod:(id)sender
{
    
    NSLog(@"name = %@",[self.person tellName]);
}

- (void)saySexMethod:(id)sender
{
    NSLog(@"sex = %@",[self.person tellSex]);
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
