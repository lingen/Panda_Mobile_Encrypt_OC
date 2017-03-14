//
//  OPEMD5Util.h
//  Panda_Mobile_Encrypt_OC
//
//  Created by lingen on 2017/3/14.
//  Copyright © 2017年 lingen.liu. All rights reserved.
//

#import <Foundation/Foundation.h>

static inline NSString * base64WithData(NSData *data) {
    return [[data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength] stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
}

static inline NSData * base64WithString(NSString *content) {
    return [[NSData alloc] initWithBase64EncodedString:content options:NSDataBase64DecodingIgnoreUnknownCharacters];
}


@interface OPEMD5Util : NSObject

/**
 *  对二进制内容进行MD5签名。
 *
 *  @return 返回十六进制字符串
 */
+ (NSString *)hexDigestUsingMD5WithData:(NSData *)data;


+ (NSString*)hexDigestUsingMD5WithFilePath:(NSString*)path;

@end
