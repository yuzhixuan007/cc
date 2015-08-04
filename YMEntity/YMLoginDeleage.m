//
//  YMLoginDeleage.m
//  yiming
//
//  Created by 叶 楠 on 15/8/4.
//  Copyright (c) 2015年 reflynet. All rights reserved.
//

#import "YMLoginDeleage.h"
#import "YMCommon.h"
#import <AFNetworking.h>


@implementation YMLoginDeleage

@synthesize result;


-(void)login:(NSString *) userName
pwd:(NSString *) pwd
compete :(void (^)(bool))compete
{
    
    NSString* content= [NSString stringWithFormat:@"<item><password>%@</password><username>%@</username></item>",userName,pwd];
    
       NSString* requestUrl = [[YMCommon getServer] stringByAppendingString: @"client/?c=member&a=login" ];
    
    NSURL* url =[NSURL URLWithString:requestUrl];
    
    NSMutableURLRequest *request =
    [[NSMutableURLRequest alloc] initWithURL:url];

    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"text/xml; charset=utf8" forHTTPHeaderField:@"Contsetent-Type"];
    [request setHTTPBody:[YMCommon getDataFromString:content]];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFXMLParserResponseSerializer * responseSer = [AFXMLParserResponseSerializer new];
    [manager setResponseSerializer:responseSer];
    
    
    NSOperation *operation =
    [manager HTTPRequestOperationWithRequest:request
                                          success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                              NSXMLParser * parser = (NSXMLParser *)responseObject;
                                              
                                              parser.delegate =self;
                                              
                                              [parser setShouldProcessNamespaces:YES];
                                              [parser parse];
                                              
                                              if (compete) {
                                                 compete(result);
                                              }

                                          }
                                          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                              // 失败后的处理
                                          }];
    [manager.operationQueue addOperation:operation];


}

@end
