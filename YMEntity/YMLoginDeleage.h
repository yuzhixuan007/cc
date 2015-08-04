//
//  YMLoginDeleage.h
//  yiming
//
//  Created by 叶 楠 on 15/8/4.
//  Copyright (c) 2015年 reflynet. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface YMLoginDeleage : NSObject

@property bool result;

-(void)login:(NSString *) userName
pwd:(NSString *) pwd
    compete :(void (^)(BOOL))compete;

@end