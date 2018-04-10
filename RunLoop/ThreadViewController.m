//
//  ThreadViewController.m
//  RunLoop
//
//  Created by user on 2018/4/10.
//  Copyright © 2018年 xiaoyi. All rights reserved.
//

#import "ThreadViewController.h"

@interface ThreadViewController ()
@property (strong, nonatomic) NSThread *thread;
@end

@implementation ThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.thread = [[NSThread alloc]initWithTarget:self selector:@selector(play1) object:nil];
    [self.thread start];
}


-(void)play1{
    @autoreleasepool{
        
        //    NSLog(@"runloop---start--");
        //    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(test1) userInfo:nil repeats:YES];
        //    //在当前子线程的runloop中的mode中添加定时器（有了Timer，runloop就可以跑起来）
        //    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
        //
        
        //timer 的scheduledTimerWithTimeInterval方法已经默认添加到了runloop中
        [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(test1) userInfo:nil repeats:YES];
        
        //启动runloop
        [[NSRunLoop currentRunLoop] run];
        NSLog(@"runloop---end--");
    }
}

-(void)test1{
    NSLog(@"test1****%@",[NSThread currentThread]);
    
}


-(void)play{
    
    @autoreleasepool{
        NSLog(@"runloop---start--");
        //在当前子线程的runloop中的mode中添加端口（其实就是加了source，有了source，runloop就可以跑起来）
        [[NSRunLoop currentRunLoop]addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
        //启动runloop
        [[NSRunLoop currentRunLoop] run];
        NSLog(@"runloop---end--");
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //在self.thread线程中调用test
    [self performSelector:@selector(test) onThread:self.thread withObject:nil waitUntilDone:YES];
}
-(void)test{
    NSLog(@"test---%@",[NSThread currentThread]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
