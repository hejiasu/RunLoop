//
//  ShowImageViewController.m
//  RunLoop
//
//  Created by user on 2018/4/10.
//  Copyright © 2018年 xiaoyi. All rights reserved.
//

#import "ShowImageViewController.h"

@interface ShowImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ShowImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self showImage];
}

#pragma mark-指定runloop执行
-(void)showImage{
    //只在NSDefaultRunLoopMode模式下显示
    [self.imageView performSelector:@selector(setImage:) withObject:[UIImage imageNamed:@"aa"] afterDelay:3 inModes:@[NSDefaultRunLoopMode]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
