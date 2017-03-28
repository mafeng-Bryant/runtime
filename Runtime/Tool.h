//
//  Tool.h
//  Runtime
//
//  Created by patpat on 2017/3/28.
//  Copyright © 2017年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tool : NSObject

+ (instancetype)sharedManager;

- (NSString *)changeMethod;

- (void)addCount;


@end
