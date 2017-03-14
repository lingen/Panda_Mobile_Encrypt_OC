//
//  OPDEncryptUtil.h
//  Panda_Mobile_Encrypt_OC
//
//  Created by lingen on 2017/3/14.
//  Copyright © 2017年 lingen.liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OPEncryptUtil : NSObject

+ (NSString*)encryptString:(NSString*)string key:(NSString*)key;

+ (NSString*)decryptString:(NSString*)string key:(NSString*)key;

+ (NSData*)encryptData:(NSData*)data key:(NSString*)key;

+ (NSData*)decryptData:(NSData*)data key:(NSString*)key;

@end
