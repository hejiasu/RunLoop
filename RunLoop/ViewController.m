//
//  ViewController.m
//  RunLoop
//
//  Created by xiaoyi on 17/3/17.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
   
    //获取当前线程的RunLoop
    [NSRunLoop currentRunLoop];
    //获取主线程的RunLoop
    [NSRunLoop mainRunLoop];
    
    
    //获取当前线程的RunLoop
    CFRunLoopGetMain();
    //获取主线程的RunLoop
    CFRunLoopGetCurrent();
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
