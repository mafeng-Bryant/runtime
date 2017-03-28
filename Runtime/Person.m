//
//  Persion.m
//  Runtime
//
//  Created by patpat on 2017/3/28.
//  Copyright © 2017年 test. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"mafeng";
    }
    return self;
}

- (NSString *)tellSex
{
    return @"i am a boy";
}

- (NSString *)tellName
{
    return @"my name is mafeng";
}

@end
