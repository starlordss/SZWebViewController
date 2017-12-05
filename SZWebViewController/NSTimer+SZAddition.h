//
//  NSTimer+SZAddition.h
//  SZWebViewController
//
//  Created by starz on 2017/12/4.
//  Copyright © 2017年 starz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (SZAddition)
- (void)sz_pause;
- (void)sz_webPageTime;
- (void)sz_webPageTimeWithInterval:(NSTimeInterval)time;
@end
