//
//  ViewController.m
//  Lesson-UI-多线程下载
//
//  Created by 林梓成 on 15/6/11.
//  Copyright (c) 2015年 lin. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+CreateByUrl.h"

#define BaseUrl @"http://news.mydrivers.com/img/20130507/ccd0f064c47f48248465e4fdc6819266.jpg"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    for (int i = 0; i < 7; i++) {
        
        for (int j = 0; j < 3; j++) {
            
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20+110*j, 20+90*i, 100, 80)];
            [imageView setImageByUrl:BaseUrl];
            [self.view addSubview:imageView];
        }
    }
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
