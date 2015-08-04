//
//  YMProfileDeleage.m
//  yiming
//
//  Created by 叶 楠 on 15/8/3.
//  Copyright (c) 2015年 reflynet. All rights reserved.
//

#import "YMProfileDeleage.h"
#import "YMCommon.h"
#import <AFNetworking.h>
@interface YMProfileDeleage()

@end

@implementation YMProfileDeleage

-(void)getData 
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFXMLParserResponseSerializer * responseSer = [AFXMLParserResponseSerializer new];
    [manager setResponseSerializer:responseSer];
    NSDictionary *dict =@{@"format":@"xml"};
    
    NSString* requestUrl = [[YMCommon getServer] stringByAppendingString: @"client/?c=channel&a=channellist" ];
    [manager GET: requestUrl parameters:dict success:^(AFHTTPRequestOperation *operation,id responseObject){
        NSXMLParser * parser = (NSXMLParser *)responseObject;
        parser.delegate =self;
        [parser setShouldProcessNamespaces:YES];
        [parser parse];
        
        
    } failure:^(AFHTTPRequestOperation *operation,NSError *error) {

        
    }];
    

}


-(void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"解析开始！");
}

//解析起始标记

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
 attributes:(NSDictionary *)attributeDict
{
    NSLog(@"标记：%@",elementName);
}

//解析文本节点

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    
    NSLog(@"值：%@",string);
    
}

//解析结束标记

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName{
    NSLog(@"结束标记：%@",elementName);
}

//文档结束时触发

-(void) parserDidEndDocument:(NSXMLParser *)parser{
    
    NSLog(@"解析结束！");
    
}

@end

