//
//  ViewController.m
//  ProjectSettingOC
//
//  Created by GK on 16/3/26.
//  Copyright © 2016年 GK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (DEBUG) {
        NSLog(@"debug");
    }else {
        NSLog(@"release");
    }
    
    NSLog(SERVER_URL);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
