//
//  AppDelegate.m
//  DDLogTest
//
//  Created by jyzx on 2019/10/11.
//  Copyright © 2019 WSK. All rights reserved.
//

#import "AppDelegate.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import <CocoaLumberjack/DDLogMacros.h>
#import "MyCustomFormatter.h"
//@import CocoaLumberjack;
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // 添加DDASLLogger，你的日志语句将被发送到Xcode控制台
    //[DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    // 添加DDTTYLogger，你的日志语句将被发送到Console.app
    //[DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDOSLogger sharedInstance]];
    // 添加DDFileLogger，你的日志语句将写入到一个文件中，默认路径在沙盒的Library/Caches/Logs/目录下，文件名为bundleid+空格+日期.log。
    
//    [DDTTYLogger sharedInstance].logFormatter = [[MyCustomFormatter alloc] init];
//
//       //自定义logfile path
//       DDLogFileManagerDefault *logFileManager = \
//       [[DDLogFileManagerDefault alloc] initWithLogsDirectory:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]];
//
//       DDFileLogger *customFileLogger = [[DDFileLogger alloc] initWithLogFileManager:logFileManager];
//
//       customFileLogger.rollingFrequency                       = 60 * 60 * 24;
//       customFileLogger.logFileManager.maximumNumberOfLogFiles = 7;
//    customFileLogger.logFormatter = [[MyCustomFormatter alloc] init];
//       [DDLog addLogger:customFileLogger];
    DDLogFileManagerDefault *logFileManager = [[DDLogFileManagerDefault alloc] init];
    
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24;
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
    
    //产生Log
    DDLogVerbose(@"Verbose");
    DDLogDebug(@"Debug %@",@"你好");
    DDLogInfo(@"Info");
    DDLogWarn(@"Warn");
    DDLogError(@"Error");
    
    DLog(@"User selected file:%@ withSize:%d", @"filePath", 123);
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
