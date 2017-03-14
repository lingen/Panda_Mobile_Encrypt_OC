//
//  NSData+AES.h
//  Panda_Mobile_Encrypt_OC
//
//  Created by lingen on 2017/3/14.
//  Copyright © 2017年 lingen.liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES)

-(NSData *)AESDecryptWithKey:(NSString *)key;

-(NSData *)AESEncryptWithKey:(NSString *)key;

@end
