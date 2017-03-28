//
//  BaseViewController.h
//  Runtime
//
//  Created by patpat on 2017/3/28.
//  Copyright © 2017年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "Tool.h"

@interface BaseViewController : UIViewController
@property (nonatomic,strong) Person* person;
@property (nonatomic,strong) Tool* tool;


@end
