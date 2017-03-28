//
//  DynamicVariableController.m
//  Runtime
//
//  Created by patpat on 2017/3/28.
//  Copyright © 2017年 test. All rights reserved.
//

#import "DynamicVariableController.h"
#import <objc/runtime.h>

@interface DynamicVariableController ()

@end

@implementation DynamicVariableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"click me in controller anywhere";
    NSLog(@"first answer is %@",self.person.name);
}


- (void)sayName
{
    unsigned int count = 0;
    Ivar *ivar = class_copyIvarList([self.person class], &count);
    for (int i = 0; i<count; i++) {
        Ivar var = ivar[i];
        const char *varname = ivar_getName(var);
        NSString* personName = [NSString stringWithUTF8String:varname];
        if ([personName isEqualToString:@"_name"]) {
            object_setIvar(self.person, var, @"fengma");
            break;
        }
    }
    NSLog(@"change name  is %@",self.person.name);
 }

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self sayName];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
