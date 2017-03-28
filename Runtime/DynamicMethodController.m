//
//  DynamicMethodController.m
//  Runtime
//
//  Created by patpat on 2017/3/28.
//  Copyright © 2017年 test. All rights reserved.
//

#import "DynamicMethodController.h"
#import <objc/runtime.h>

@interface DynamicMethodController ()

@end

@implementation DynamicMethodController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)sayFrom
{
   class_addMethod([self.person class], @selector(guess), (IMP)guessAnswer, "v@:");
   if ([self.person respondsToSelector:@selector(guess)]) {
        [self.person performSelector:@selector(guess)];
    }else {
        NSLog(@"no this method");
    }
}

void guessAnswer(id self ,SEL _cmd)
{
    Person* p = (Person*)self;
    NSLog(@"%@  peron = %@ name = %@",NSStringFromSelector(_cmd),self,p.name);
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self sayFrom];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
