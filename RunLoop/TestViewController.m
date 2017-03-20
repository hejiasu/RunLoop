//
//  TestViewController.m
//  RunLoop
//
//  Created by xiaoyi on 17/3/18.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "TestViewController.h"
#import "SSThread.h"
@interface TestViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) SSThread *thread;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //runloop可以使子线程长期常驻
    [self loadThread];

    
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    [self showImage];
    
    //runloop可以使子线程长期常驻
//    [self performSelector:@selector(test) onThread:self.thread withObject:nil waitUntilDone:YES];
    
    //自动释放池
    [self execute];
}

#pragma mark-指定runloop执行
-(void)showImage{
    //只在NSDefaultRunLoopMode模式下显示
    [self.imageView performSelector:@selector(setImage:) withObject:[UIImage imageNamed:@"aa"] afterDelay:3 inModes:@[NSDefaultRunLoopMode]];
}


#pragma mark-runloop可以使子线程长期常驻
/*
 取消runloop可以移除port或者退出线程
 */
-(void)loadThread{
    
    self.thread = [[SSThread alloc]initWithTarget:self selector:@selector(run) object:nil];
    
    [self.thread start];
}

-(void)run{
    
    NSLog(@"runloop---start--");
    //添加端口（加source）
    [[NSRunLoop currentRunLoop]addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    //创建并运行
    [[NSRunLoop currentRunLoop] run];
    NSLog(@"runloop---end--");
}

-(void)test{
    NSLog(@"test---%@",[NSThread currentThread]);
}



#pragma mark- 子线程创建runloop要创建一个自动释放池
//睡眠之前会启动释放池，下一次唤醒时会自动创建
-(void)execute{
    
    NSThread *th = [[NSThread alloc]initWithTarget:self selector:@selector(autTH) object:nil];
    [th start];
    
    
}

-(void)autTH{
    @autoreleasepool {
        
        NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(aut) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
        [[NSRunLoop currentRunLoop] run];
    }
}

-(void)aut{
    NSLog(@"aut--%@",[NSThread currentThread]);
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
