//
//  PassValueDelegate.h
//  yiming
//
//  Created by weiwei wei on 15/8/10.
//  Copyright (c) 2015年 reflynet. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PassValueDelegate <NSObject>
-(void)passValue:(int) type value:(NSString *)value;
@end
