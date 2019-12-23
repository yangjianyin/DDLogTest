//
//  MyCustomFormatter.h
//  DDLogTest
//
//  Created by jyzx on 2019/10/11.
//  Copyright © 2019 WSK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCustomFormatter : NSObject<DDLogFormatter>{
    int loggerCount;
    NSDateFormatter *threadUnsafeDateFormatter;
}

@end

NS_ASSUME_NONNULL_END
