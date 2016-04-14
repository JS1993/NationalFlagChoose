//
//  Flag.m
//  国旗选择
//
//  Created by  江苏 on 16/4/14.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "Flag.h"

@implementation Flag
-(instancetype)initWithDict:(NSDictionary*)dict{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)flagWithDict:(NSDictionary*)dict{
    return [[self alloc]initWithDict:dict];
}
+(NSArray*)flags{
    NSMutableArray* arrM=[NSMutableArray array];
    NSArray* arr=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"flags" ofType:@"plist"]];
    for (NSDictionary* dic in arr ) {
        [arrM addObject:[self flagWithDict:dic]];
    }
    return arrM;
}

@end
