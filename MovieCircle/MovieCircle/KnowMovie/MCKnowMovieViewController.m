//
//  MCKnowMovieViewController.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCKnowMovieViewController.h"

@interface MCKnowMovieViewController ()

@end

@implementation MCKnowMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"识影";

    
    //af封装
    [self testRequest];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//http://182.92.222.50/index.php?s=App/get_list&limit=6
//http://182.92.103.164:9000/yingshiquanApp/index.php?g=Portal&m=common&a=goodsSmallCategory

-(void)testRequest
{
    
    
    [[MCRequestManager sharedInstance]getOpenCitiesSucess:^(NSString *data){
        id parseData = nil;
        if (CheckValidString(data)) {
            parseData = [data objectFromJSONString];
        }

        
    } failure:^(NSError *error){
                                                    
                                                    
    }];
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
