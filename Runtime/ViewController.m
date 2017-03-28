//
//  ViewController.m
//  Runtime
//
//  Created by patpat on 2017/3/28.
//  Copyright © 2017年 test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewListController.h"

@interface ViewController ()
@property (nonatomic,strong) UIButton* btn;

@end

@implementation ViewController

- (void)viewDidLoad
{
     [super viewDidLoad];
     [self.view addSubview:self.btn];
}

#pragma mark response
- (void)showRunTimeList:(id)sender
{
    TableViewListController* listVC = [[TableViewListController alloc]initWithNibName:@"TableViewListController" bundle:nil];
    UINavigationController* na = [[UINavigationController alloc]initWithRootViewController:listVC];
    [self presentViewController:na animated:YES completion:nil];
}

#pragma mark set and get method
-(UIButton *)btn
{
    if (!_btn) {
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"Click Me" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 100, 100);
        [btn addTarget:self action:@selector(showRunTimeList:) forControlEvents:UIControlEventTouchUpInside];
        btn.center =self.view.center;
        btn.backgroundColor = [UIColor blueColor];
        _btn = btn;
    }
    return _btn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
