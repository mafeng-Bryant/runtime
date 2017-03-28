//
//  ViewController.m
//  Runtime
//
//  Created by patpat on 2017/3/28.
//  Copyright © 2017年 test. All rights reserved.
//

#import "ViewController.h"
#import "objc/runtime.h"
#import "Persion.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"sss");
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    /*
    unsigned int count = 0;
    Class *classes = objc_copyClassList(&count);
    for (int i = 0; i<count; i++) {
        const char *cname = class_getName(classes[i]);
        printf("%s\n",cname);
    }
     */

    /*
    Class classpersion = NSClassFromString(@"Persion");
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(classpersion, &count);//获取成员变量数组
    for (int i = 0; i<count; i++) {
        const char *cname = ivar_getName(ivarList[i]);
        NSString* name = [NSString stringWithUTF8String:cname];
        NSLog(@"name = %@",name);
    }
    NSLog(@"---------------------------------------------------------");
    objc_property_t *propertyList = class_copyPropertyList(classpersion, &count);//获取属性数组
    for (int i = 0; i<count; i++) {
        const char *cname = property_getName(propertyList[i]);
        NSString* name = [NSString stringWithUTF8String:cname];
        NSLog(@"name = %@",name);
    }
     */
    
    
 
    
    Class classpersion = NSClassFromString(@"Persion");
    unsigned int count = 0;
   Ivar *ivar = class_copyIvarList(classpersion, &count);
    for (int i = 0; i<count; i++) {
        const char *cname = ivar_getName(ivar[i]);
        NSString* name = [NSString stringWithUTF8String:cname];
        if ([name isEqualToString:@"_name"]) {
            object_setIvar(classpersion, ivar[i], @"pppp");
        }
    }
    
    
    Persion* p = [[Persion alloc]init];
    NSLog(@"name = %@\n",p.name);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
