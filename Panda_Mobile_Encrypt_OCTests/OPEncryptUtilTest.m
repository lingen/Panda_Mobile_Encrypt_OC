//
//  OPEncryptUtilTest.m
//  Panda_Mobile_Encrypt_OC
//
//  Created by lingen on 2017/3/14.
//  Copyright © 2017年 lingen.liu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OPEncryptUtil.h"

@interface OPEncryptUtilTest : XCTestCase

@end

static NSString* ENCRYPT_KEY = @"OPE";

@implementation OPEncryptUtilTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testEncrypt {
    NSString* string = @"This is a common text";
    
    NSString* encrtypString = [OPEncryptUtil encryptString:string key:ENCRYPT_KEY];
    
    NSString* descriptString = [OPEncryptUtil decryptString:encrtypString key:ENCRYPT_KEY];
    
    assert([descriptString isEqualToString:string]);
}

@end
