//
//  ObserverViewController.m
//  RunLoop
//
//  Created by xiaoyi on 17/3/17.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "ObserverViewController.h"

@interface ObserverViewController ()

@end

@implementation ObserverViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    

    [self observer];

}

-(void)observer{
    /*
    typedef CF_OPTIONS(CFOptionFlags, CFRunLoopActivity) {
        kCFRunLoopEntry = (1UL << 0),//即将进入Runloop
        kCFRunLoopBeforeTimers = (1UL << 1),//即将处理Timer
        kCFRunLoopBeforeSources = (1UL << 2),//即将处理Source事件
        kCFRunLoopBeforeWaiting = (1UL << 5),//即将进入休眠
        kCFRunLoopAfterWaiting = (1UL << 6),//刚才休眠中唤醒
        kCFRunLoopExit = (1UL << 7),//即将退出runloop
        kCFRunLoopAllActivities = 0x0FFFFFFFU
    };
     */
    
    /*
      添加Observer
      参数1：默认值
      参数2：监听活动（这里监听了kCFRunLoopAllActivities）
      参数3：重复
      参数4：0
    */
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        NSLog(@"---监听Runloop状态改变--%lu",activity);
    });
    
    /*
    添加观察者，监听Runloop的在kCFRunLoopDefaultMode模式下的状态
    参数1：当前runloop
    参数2：监听者
    参数3：模式
    */
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
    
    
    //释放Observer
    CFRelease(observer);
}


/*
 CF的内存管理
 1、凡是带有Create、copy、retain等字眼的函数，创建出来的对象，都需要在最后做一次release
 2、release函数：CFRelease(observer);
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
