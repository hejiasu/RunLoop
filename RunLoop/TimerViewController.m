//
//  TimerViewController.m
//  RunLoop
//
//  Created by xiaoyi on 17/3/17.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self timer];
    [self timer1];
    
}

-(void)timer{
    //调用scheduledTimer返回定时器，系统已自动添加RunLoop中，而且默认在NSDefaultRunLoopMode模式
    NSTimer *timer =  [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    //修改模式
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
}


-(void)timer1{
    
    //调用timerWith返回定时器，需要手动加入Runloop
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    
    //只运行在NSDefaultRunLoopMode模式，一旦RunLoop进入其他模式，定时器就不会工作了
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    //只运行在UITrackingRunLoopMode模式，一旦RunLoop进入其他模式，定时器就不会工作了
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
    
    //定时器会在标记Common modes的模式下会工作，标记为Common modes的模式：UITrackingRunLoopMode和NSDefaultRunLoopMode
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}


-(void)run{
    NSLog(@"___");
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
