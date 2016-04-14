//
//  Flag.h
//  国旗选择
//
//  Created by  江苏 on 16/4/14.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flag : NSObject
@property(copy,nonatomic)NSString* name;
@property(copy,nonatomic)NSString* icon;

+(NSArray*)flags;
@end
