//
//  KCScrollViewController.m
//  UIView&UIScrollView
//
//  Created by 软件工程系01 on 16/8/10.
//  Copyright © 2016年 软件工程系01. All rights reserved.
//

#import "KCScrollViewController.h"
#import "transformViewController.h"
#import "AppDelegate.h"
@interface KCScrollViewController ()<UITextFieldDelegate>
{

    AppDelegate *delegate;
    UITextField *text ;
    NSString *notContainHTTPString;
}
@end

@implementation KCScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    delegate=[[UIApplication sharedApplication]delegate];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(20, 64, 100, 30)];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    button.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(tohui) forControlEvents:UIControlEventTouchUpInside];
    
    
    text = [[UITextField alloc]initWithFrame:CGRectMake(10, 150, self.view.frame.size.width-20, 50)];
    text.backgroundColor=[UIColor whiteColor];
      //[text sizeToFit];
    text.borderStyle=UITextBorderStyleLine;
    [text setTintColor:[UIColor blackColor]];
    [text addTarget:self action:@selector(texttui:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:text];
    
     
    
    
    NSLog(@"dddfdd");
    UIButton *button2=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-40, 230, 100, 40)];
    [button2 setTitle:@"提交" forState:UIControlStateNormal];
    button2.backgroundColor=[UIColor lightGrayColor];
    
    [button addTarget:self action:@selector(tijiao) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    
}

//http://202.206.249.15/Health/
//http://202.206.249.15/H_Guardian/

-(void)texttui:(id)sender
{
    NSLog(@"fdff");
    [text resignFirstResponder];
}

-(void)tijiao{
    
    
    NSString *s=@"http://202.206.249.15/Health/ ";
    NSLog(@"text.text=%@",text.text);
    
    NSString *string=text.text;
    NSString *ifInputHTTP=[string substringToIndex:1];
    
    NSLog(@"ifInputHTTP=%@",ifInputHTTP);
    
    if ([ifInputHTTP isEqualToString:@"h"]) {
        
        if ([string length]==22) {
            
          notContainHTTPString=[string substringWithRange:NSMakeRange(7, 21)];
          NSLog(@"有http的处理notContainHTTPString=%@",notContainHTTPString);
            
        }else {
        
            if ([string length]==29) {
                
                notContainHTTPString=[string substringWithRange:NSMakeRange(7, 21)];
                NSLog(@"有http的处理notContainHTTPString=%@",notContainHTTPString);
                
            }
        
        }
        
    }else {
        
       if([ifInputHTTP isEqualToString:@"2"]){
    
          notContainHTTPString=ifInputHTTP;
           
           if ([notContainHTTPString length]==22) {
               
               NSString *url=[notContainHTTPString substringFromIndex:14];
               delegate.weburl=url;
                NSLog(@"url=%@",delegate.weburl);
           }else{
           
           
                if ([notContainHTTPString length]==26) {
               
                   NSString *url=[notContainHTTPString substringFromIndex:14];
                   delegate.weburl=url;
                }else{
                    
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"11网址输入错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                    [alert show];

                
                }
           
           }
           
       }else{
           UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"网址输入错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
           [alert show];
       
       }
    }
    
    
    //[self showurl];
}



-(void)showurl{
    NSLog(@"dddd");

    UILabel *la=[[UILabel alloc]initWithFrame:CGRectMake(10, 300, self.view.frame.size.width-20, 50)];
    la.text=delegate.weburl;
    la.textColor=[UIColor blackColor];
    [self.view addSubview:la];


}

-(void)tohui{

    transformViewController * vv=[[transformViewController alloc]init];
    [self presentModalViewController:vv animated:YES];

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
