//
//  NSTimer+SZAddition.m
//  SZWebViewController
//
//  Created by starz on 2017/12/4.
//  Copyright © 2017年 starz. All rights reserved.
//

#import "NSTimer+SZAddition.h"

@implementation NSTimer (SZAddition)
- (void)sz_pause {
    if (!self.isValid) return;
    [self setFireDate:[NSDate distantFuture]];
    
}
- (void)sz_webPageTime {
    if (!self.isValid) return;
    [self setFireDate:[NSDate date]];
    
}
- (void)sz_webPageTimeWithInterval:(NSTimeInterval)time{
    if (!self.isValid) return;
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:time]];
}
@end
