//
//  ViewController.m
//  KeyChain
//
//  Created by chenlishuang on 2017/8/21.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "ViewController.h"
#import "KeyChain.h"
@interface ViewController ()

@end
NSString * const KEY_USERNAME_PASSWORD = @"com.company.app.usernamepassword";
NSString * const KEY_USERNAME = @"com.company.app.username";
NSString * const KEY_PASSWORD = @"com.company.app.password";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableDictionary *userNamePasswordKVPairs = [NSMutableDictionary dictionary];
    [userNamePasswordKVPairs setObject:@"userName" forKey:KEY_USERNAME];
    [userNamePasswordKVPairs setObject:@"password" forKey:KEY_PASSWORD];
    NSLog(@"%@", userNamePasswordKVPairs); //有KV值
    
    // 1、将用户名和密码写入keychain
    [KeyChain save:KEY_USERNAME_PASSWORD data:userNamePasswordKVPairs];
    // 2、从keychain中读取用户名和密码
    NSMutableDictionary *readUsernamePassword = (NSMutableDictionary *)[KeyChain load:KEY_USERNAME_PASSWORD];
    NSString *userName = [readUsernamePassword objectForKey:KEY_USERNAME];
    NSString *password = [readUsernamePassword objectForKey:KEY_PASSWORD];
    NSLog(@"username = %@", userName);
    NSLog(@"password = %@", password);
    
    // 3、将用户名和密码从keychain中删除
    [KeyChain delete:KEY_USERNAME_PASSWORD];
}


@end
