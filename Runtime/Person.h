//
//  Persion.h
//  Runtime
//
//  Created by patpat on 2017/3/28.
//  Copyright © 2017年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
     @private  float _height;
}

@property(nonatomic,copy) NSString* name;
@property(nonatomic,assign) int age;

-(NSString *)tellName;
-(NSString *)tellSex;

@end
