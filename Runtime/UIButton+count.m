//
//  UIButton+count.m
//  Runtime
//
//  Created by patpat on 2017/3/28.
//  Copyright © 2017年 test. All rights reserved.
//

#import "UIButton+count.h"
#import "Tool.h"

@implementation UIButton (count)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    
        Class selfClass = [self class];
        
        SEL originSel = @selector(sendAction:to:forEvent:);
      
        Method originMethod = class_getInstanceMethod(selfClass, originSel);
        
        SEL customSel = @selector(mySendAction:to:forEvent:);
        
        Method customMethod = class_getInstanceMethod(selfClass, customSel);
        
        BOOL addsuccess = class_addMethod(selfClass, originSel, method_getImplementation(customMethod), method_getTypeEncoding(customMethod));
    
        if (addsuccess) {
            
            class_replaceMethod(selfClass, customSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
            
        }else {
            method_exchangeImplementations(originMethod, customMethod);
        }
        
    });
}

- (void)mySendAction:(SEL)action to:(id)target forEvent:(UIEvent*)event
{
    [[Tool sharedManager] addCount];
    [self mySendAction:action to:target forEvent:event];
}



@end
