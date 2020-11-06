//
//  MainViewController.m
//  TableViewSelectExpand
//
//  Created by khj on 2020/11/6.
//  Copyright © 2020 khj. All rights reserved.
//

#import "MainViewController.h"
#import "AddFeedbackViewController.h"
#import "MultipleSellectViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *singleSelectBut = [UIButton buttonWithType:(UIButtonTypeCustom)];
    singleSelectBut.frame = CGRectMake(20, 120, SCREENWIDTH - 40, 44);
    singleSelectBut.backgroundColor = KMainColor;
    [singleSelectBut setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [singleSelectBut setTitle:@"tableView单选" forState:(UIControlStateNormal)];
    [singleSelectBut addTarget:self action:@selector(didClickedSingleSelectBut) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:singleSelectBut];
    
    
    
    UIButton *multipleSelectBut = [UIButton buttonWithType:(UIButtonTypeCustom)];
    multipleSelectBut.frame = CGRectMake(20, CGRectGetMaxY(singleSelectBut.frame) + 20, SCREENWIDTH - 40, 44);
    multipleSelectBut.backgroundColor = KMainColor;
    [multipleSelectBut setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [multipleSelectBut setTitle:@"tableView多选" forState:(UIControlStateNormal)];
    [multipleSelectBut addTarget:self action:@selector(didClickedMultipleSelectBut) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:multipleSelectBut];


}

- (void)didClickedSingleSelectBut {
    AddFeedbackViewController *vc = [AddFeedbackViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didClickedMultipleSelectBut {
    MultipleSellectViewController *vc = [MultipleSellectViewController new];
    [self.navigationController pushViewController:vc animated:YES];
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
