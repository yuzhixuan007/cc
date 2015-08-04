//
//  YMCommon.m
//  yiming
//
//  Created by 叶 楠 on 15/8/1.
//  Copyright (c) 2015年 reflynet. All rights reserved.
//

#import "YMCommon.h"

@implementation YMCommon

+(NSString*)getServer
{
    return @"http://ymoffice.testweb.iwanshang.cn/";
}

+(NSData*) getDataFromString:(NSString*) str
{
    
  NSData* xmlData = [str dataUsingEncoding:NSUTF8StringEncoding];
    return  xmlData;
}

@end