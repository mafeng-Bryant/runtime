//
//  TableViewListController.m
//  Runtime
//
//  Created by patpat on 2017/3/28.
//  Copyright © 2017年 test. All rights reserved.
//

#import "TableViewListController.h"
#import "BaseViewController.h"
#import "DynamicVariableController.h"
#import "DynamicMethodController.h"
#import "DynamicExchangeController.h"
#import "DynamicReplaceController.h"
#import "DynamicAddFunctionController.h"
#import "DynamicNSCodingController.h"
#import "DynamicModelController.h"

@interface TableViewListController ()
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation TableViewListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"runtime";
    _dataSource = @[@"动态变量控制",
                    @"动态添加方法",
                    @"动态交换两个方法的实现",
                    @"拦截并替换方法",
                    @"在方法上增加额外功能",
                    @"实现NSCoding的自动归档和解档",
                    @"实现字典转模型的自动转换"
                    ];
    self.tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
     }
    cell.textLabel.text = _dataSource[indexPath.row];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    BaseViewController* baseVC;
    NSInteger index = indexPath.row;
    switch (index) {
        case 0:{
            baseVC = [[DynamicVariableController alloc]init];
            break;
        }
        case 1:{
            baseVC = [[DynamicMethodController alloc]init];
            break;
        }
        case 2:{
            baseVC = [[DynamicExchangeController alloc]init];
            break;
        }
        case 3:{
            baseVC = [[DynamicReplaceController alloc]init];
            break;
        }
        case 4:{
            baseVC = [[DynamicAddFunctionController alloc]init];
            break;
        }
        case 5:{
            baseVC = [[DynamicNSCodingController alloc]init];
            break;
        }
        case 6:{
            baseVC = [[DynamicModelController alloc]init];
            break;
        }
        default:
            break;
    }
    if (baseVC) {
        [self.navigationController pushViewController:baseVC animated:YES];
     }

}

@end
