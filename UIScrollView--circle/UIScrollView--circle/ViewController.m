//
//  ViewController.m
//  UIScrollView--circle
//
//  Created by 软件工程系01 on 16/10/20.
//  Copyright © 2016年 软件工程系01. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor yellowColor];
    
       
    int  y=80;
    for (int i=1; i<=3; i++) {
        
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(10, 100+y*i, 100, 50)];
        [btn setTintColor:[UIColor blueColor]];
        btn.backgroundColor=[UIColor lightGrayColor];
        btn.tag=i;
        [self.view addSubview:btn];
        if (btn.tag==1) {
    
            [btn setTitle:@"第一种方式" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(yi) forControlEvents:UIControlEventTouchUpInside];
        }
        if (btn.tag==2) {
            [btn setTitle:@"第二种方式" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(er) forControlEvents:UIControlEventTouchUpInside];
        }
        if (btn.tag==3) {
            [btn setTitle:@"第三种方式" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(san) forControlEvents:UIControlEventTouchUpInside];
        }
        
    }
    
}

-(void)yi{
    
    ViewController1 *yi=[[ViewController1 alloc]init];
    [self.navigationController pushViewController:yi animated:NO];
}

-(void)er{
    
    ViewController1 *er=[[ViewController1 alloc]init];
    [self.navigationController pushViewController:er animated:NO];
}

-(void)san{
    
    ViewController1 *san=[[ViewController1 alloc]init];
    [self.navigationController pushViewController:san animated:NO];
}

@end
