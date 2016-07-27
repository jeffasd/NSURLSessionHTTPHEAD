//
//  ViewController.m
//  tset_NSURLSession_01
//
//  Created by jeffasd on 16/7/26.
//  Copyright © 2016年 jeffasd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //1.创建NSURLSession对象（可以获取单例对象）
    NSURLSession *session = [NSURLSession sharedSession];
    
    //2.根据NSURLSession对象创建一个Task
    
    NSURL *url = [NSURL URLWithString:@"http://pd.5aikan.cn/pianduan/url/getsong.php?type=fcurl&fcid=20437774"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"HEAD"];
    
//    request
    
    //方法参数说明
    /*
     注意：该block是在子线程中调用的，如果拿到数据之后要做一些UI刷新操作，那么需要回到主线程刷新
     第一个参数：需要发送的请求对象
     block:当请求结束拿到服务器响应的数据时调用block
     block-NSData:该请求的响应体
     block-NSURLResponse:存放本次请求的响应信息，响应头，真实类型为NSHTTPURLResponse
     block-NSErroe:请求错误信息
     */
    NSURLSessionDataTask * dataTask =  [session dataTaskWithRequest:request completionHandler:^(NSData * __nullable data, NSURLResponse * __nullable response, NSError * __nullable error) {
        
        //拿到响应头信息
        NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
        
        //4.解析拿到的响应数据
        NSLog(@"%@\n%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding],res.allHeaderFields);
    }];
    
    
//    session da
    
    //3.执行Task
    //注意：刚创建出来的task默认是挂起状态的，需要调用该方法来启动任务（执行任务）
    [dataTask resume];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
