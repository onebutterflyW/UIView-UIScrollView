//
//  ViewController1.m
//  UIScrollView--circle
//
//  Created by 软件工程系01 on 16/10/20.
//  Copyright © 2016年 软件工程系01. All rights reserved.
//


//这种方式滑倒第一张和最后一张时图片的切换是跳转，
#import "ViewController1.h"

@interface ViewController1 ()<UIScrollViewDelegate>
{

    int k;

}
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    slideImages=@[[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"4.jpg"],];
  
    [self realizeScrollLoop1];

}

- (void)realizeScrollLoop1{
    
    scrollView = [[UIScrollView alloc] init];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.frame = self.view.bounds ;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    [scrollView setContentSize:CGSizeMake(([slideImages count] + 2) * scrollView.frame.size.width, 0)];
    
    CGSize scrollViewSize = scrollView.frame.size;
    
    // 遍历创建子控件
    for(int j=0;j<[slideImages count];j++){
        UIImageView *imageView = [[UIImageView alloc] init];
        UIImage *image=slideImages[j];
        imageView.image =image;
        imageView.clipsToBounds=YES;
        imageView.frame = CGRectMake(j * scrollViewSize.width, 0, scrollViewSize.width, scrollViewSize.height);
        [scrollView addSubview:imageView];
    }
    
    
        

    

  
}





- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollVieww{
    NSInteger page = scrollVieww.contentOffset.x / scrollVieww.frame.size.width;

    // 如果当前页是第0页就跳转到数组中最后一个地方进行跳转
        if (page == 0) {
            
            // 将第一张图片放到最后位置，造成视觉上的循环
//            UIImageView *lastImageView = [[UIImageView alloc] init];
//            UIImage *image4=slideImages[[slideImages count]-1];
//            lastImageView.image = image4;
//            lastImageView.frame = CGRectMake( scrollView.frame.size.width * ([slideImages count]-1), 0,  scrollView.frame.size.width,  scrollView.frame.size.height);
//            [scrollView addSubview:lastImageView];
            [scrollVieww setContentOffset:CGPointMake(scrollVieww.frame.size.width * ([slideImages count]-1), 0)];
            
            
        }
        
        if (page == [slideImages count]){
            // 如果是第最后一页就跳转到数组第一个元素的地点
            
            // 将最后一张图片弄到第一张的位置
//            UIImageView *imageView = [[UIImageView alloc] init];
//            UIImage *image=slideImages[0];
//            imageView.image = image;
//            imageView.frame = CGRectMake(0, 0, scrollVieww.frame.size.width, scrollVieww.frame.size.height);
//            
//            [scrollView addSubview:imageView];
            [scrollVieww setContentOffset:CGPointMake(0, 0)];
        }
  
}

@end
