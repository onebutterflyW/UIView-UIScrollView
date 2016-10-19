//
//  transformViewController.m
//  UIView&UIScrollView
//
//  Created by 软件工程系01 on 16/8/10.
//  Copyright © 2016年 软件工程系01. All rights reserved.
//

#import "transformViewController.h"
#import "KCScrollViewController.h"


#define NORMAL_COLOR [UIColor colorWithRed:75/255.0 green:160/255.0 blue:253/255.0 alpha:1.0]
#define HIGHLIGHTED_COLOR [UIColor colorWithRed:197/255.0 green:221/225.0 blue:249/225.0 alpha:1.0]



@interface transformViewController ()<UIAlertViewDelegate>
{
    UIImageView *imageView;
    UIButton *btnRotation;
    UIButton *btnScale;
    UIButton *btnTranslate;

}
@end

@implementation transformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self addImageView];
    
    //添加旋转button－－－注意第一句与第二句的顺序，如果先二后一，不显示button
    btnRotation=[self getButton:@"旋转"];//第一句
    btnRotation.frame=CGRectMake(20, 300, 280, 30);//第二句
 
    [btnRotation addTarget:self action:@selector(addRotation) forControlEvents:UIControlEventTouchUpInside];
    
    //添加缩放button
    btnScale=[self getButton:@"缩放"];
    CGRect scalButtonFrame=btnRotation.frame;
    scalButtonFrame.origin.y+=40;
    
    btnScale.frame=scalButtonFrame;
    [btnScale addTarget:self action:@selector(addScale) forControlEvents:UIControlEventTouchUpInside];
    
    //添加平移的button
     btnTranslate=[self getButton:@"平移"];
    CGRect translateButtonFrame=btnScale.frame;
    translateButtonFrame.origin.y+=40;
   
    btnTranslate.frame=translateButtonFrame;
    [btnTranslate addTarget:self action:@selector(addTranslate) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(100, self.view.frame.size.height-100, 200, 40)];
    [button setTitle:@"UIScrollView" forState:UIControlStateNormal];
    button.backgroundColor=[UIColor lightGrayColor];
    [button setTintColor:[UIColor blackColor]];
    [button addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *buttonq=[[UIButton alloc]initWithFrame:CGRectMake(100, self.view.frame.size.height-200, 200, 40)];
    [buttonq setTitle:@"alert测试" forState:UIControlStateNormal];
    buttonq.backgroundColor=[UIColor lightGrayColor];
    [buttonq setTintColor:[UIColor blackColor]];
    [buttonq addTarget:self action:@selector(alertTect) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonq];
    
}

-(void)alertTect{


    UIAlertView *cs=[[UIAlertView alloc]initWithTitle:@"第一级" message:@"输入您的名字" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",@"不知道",nil];
   
    
    [cs setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    UITextField *field=[cs textFieldAtIndex:0];
    cs.tag=101;
    
    field.placeholder=@"输入您的名字" ;

    [cs show];



}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    NSString *buttonText=[alertView buttonTitleAtIndex:buttonIndex];
    
    if (alertView.tag==101) {
        
        if (buttonIndex==alertView.firstOtherButtonIndex) {
            
            NSString *text=[alertView  textFieldAtIndex:0].text;
            
            if ([text isEqualToString:@"wmm"]) {
                
                UIAlertView *css=[[UIAlertView alloc]initWithTitle:@"第er级" message:@"您的名字是wmm" delegate:self cancelButtonTitle:@"cancle" otherButtonTitles:@"yes",nil];
                css.tag=102;
                [css show];

            }else{
            
            
                UIAlertView *csss=[[UIAlertView alloc]initWithTitle:@"提示" message:@"请正确输入您的名字" delegate:self cancelButtonTitle:@"cancle" otherButtonTitles:@"yes",nil];
                  csss.tag=103;
                [csss show];
            
            }
        }else{
        
            if ([buttonText isEqualToString:@"不知道"]) {
                
                 NSLog(@"不知道名字");
            }
        
        }
        
        
    }else{
        
        if (alertView.tag==102) {
            
             if (buttonIndex==alertView.firstOtherButtonIndex) {
                
                NSLog(@"输出二级警示框102提示点击yes，名字是wmm");
             }

         }else{
        
            NSLog(@"输出二级警示框103提示点击yes，未输入");
        
        }
        
        
        
    
    
    }




}






-(void)jump{

    KCScrollViewController *croll=[[KCScrollViewController alloc]init];
    [self presentModalViewController:croll animated:YES];

}

//添加图片
-(void)addImageView{

    UIImage *image = [UIImage imageNamed:@"back.jpg"];
   
    imageView=[[UIImageView alloc]initWithImage:image];
    
    imageView.frame = CGRectMake(20, 100, 280, 30);
    
    imageView.contentMode=UIViewContentModeScaleAspectFill;
    
    [self.view addSubview:imageView];

}


-(void)addRotation{

    CGFloat angle=M_PI_4;
    imageView.transform=CGAffineTransformRotate(imageView.transform, angle);

}

-(void)addScale{
    CGFloat scaleOffSet=0.9;
    imageView.transform=CGAffineTransformScale(imageView.transform, scaleOffSet, scaleOffSet);

}

-(void)addTranslate{

    
        CGFloat translateY=50;
    
        imageView.transform=CGAffineTransformTranslate(imageView.transform, 0, translateY);
   

}

-(UIButton *)getButton:(NSString *)title
{

    UIButton *button=[[UIButton alloc ]init];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:NORMAL_COLOR forState:UIControlStateNormal];
    
    [button setTitleColor:HIGHLIGHTED_COLOR forState:UIControlStateHighlighted];
    
    [self.view addSubview:button];
    

    return button;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
