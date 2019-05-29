//
//  TimerViewController.m
//  RunLoop
//
//  Created by xiaoyi on 17/3/17.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()
@property (nonatomic,strong) NSTimer *timer;
@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_async(queue, ^{
        NSLog(@"^^%@",[NSThread currentThread]);

        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
        
    });
    
}

- (IBAction)scheduledTimer:(id)sender {
   
    //调用scheduledTimer返回定时器，系统已自动添加RunLoop中，而且默认在NSDefaultRunLoopMode模式,这样每隔1s都会执行run
    //但是当你滑动textView时，定时器将失效，run方法停止执行，当你停止滑动时，run方法继续执行
    NSLog(@"^^%@",[NSThread currentThread]);
    NSTimer *timer =  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    
    
    //修改模式(当你把这个timer添加到当前的runloop中时，不管你滑不滑动textView，run方法都会执行)
//    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
}

- (IBAction)timerWith:(id)sender {
    NSLog(@"^^%@",[NSThread currentThread]);

    //调用timerWith返回定时器，需要手动加入Runloop
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    
    //1、只运行在NSDefaultRunLoopMode模式，一旦RunLoop进入其他模式（当你滑动textView时），定时器就不会工作了（run方法不执行）
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
//
//    //2、只运行在UITrackingRunLoopMode模式，一旦RunLoop进入其他模式（当不滑动textView时），定时器就不会工作了（run方法不执行）
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
//
//    //3、定时器会在标记Common modes的模式下会工作，标记为Common modes的模式（不管你滑不滑动textView，run方法都执行）：UITrackingRunLoopMode和NSDefaultRunLoopMode
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}


-(void)run{
    NSLog(@"___%@",[NSThread currentThread]);
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
