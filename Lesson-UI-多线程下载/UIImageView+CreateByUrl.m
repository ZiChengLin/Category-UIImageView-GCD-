//
//  UIImageView+CreateByUrl.m
//  Lesson-UI-多线程下载
//
//  Created by 林梓成 on 15/6/11.
//  Copyright (c) 2015年 lin. All rights reserved.
//

#import "UIImageView+CreateByUrl.h"

@implementation UIImageView (CreateByUrl)

-(void)setImageByUrl:(NSString *)urlString {
    
    __block UIImageView *weakSelf = self;    // 在block内部使用的变量
    
    // 创建一个子线程来做数据请求
    dispatch_queue_t downLoadQueue = dispatch_queue_create("downLoad", NULL);
    
    // 在线程队列里面创建一个子线程
    dispatch_async(downLoadQueue, ^{
       
        // 数据请求
        NSURL *url = [NSURL URLWithString:urlString];
        // 同步请求
        NSData *data = [NSData dataWithContentsOfURL:url];
        // 用请求回来的data创建一个UIImage
        UIImage *image = [UIImage imageWithData:data];
        
        // 回到主线程更新UI
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            // 主线程 可以更新UI
            weakSelf.image = image;
            
        });
        
    });
    
}

@end
