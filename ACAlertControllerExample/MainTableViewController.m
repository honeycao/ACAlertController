//
//  MainTableViewController.m
//  ACAlertControllerExample
//
//  Created by caoyq on 2017/3/17.
//  Copyright © 2017年 ArthurCao. All rights reserved.
//

#import "MainTableViewController.h"
#import "ACAlertController.h"

@interface MainTableViewController ()

/** action titles */
@property (nonatomic, strong) NSArray *titles;

/** cancel title */
@property (nonatomic, copy) NSString *cancelTitle;

@end

@implementation MainTableViewController

- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"相册", @"从手机拍照", @"自定义画图"];
    }
    return _titles;
}

- (NSString *)cancelTitle {
    if (!_cancelTitle) {
        _cancelTitle = @"取消";
    }
    return _cancelTitle;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        [self createUIAlertController];
    }else {
        [self createACAlertController];
    }
}

#pragma mark - method

- (void)createUIAlertController {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    for (NSInteger index = 0; index < self.titles.count; index++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:self.titles[index] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            // do nothing
        }];
        [alert addAction:action];
    }
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:self.cancelTitle style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)createACAlertController {
    
    /* 更多使用请查看 readme */
    
    //1、初始化
    ACAlertController *action2 = [[ACAlertController alloc] initWithActionSheetTitles:self.titles cancelTitle:self.cancelTitle];
    
    //2、获取点击事件
    [action2 clickActionButton:^(NSInteger index) {
        NSLog(@"选中的item = %ld", (long)index);
    }];
    
    //3、显示
    [action2 show];
}

@end
