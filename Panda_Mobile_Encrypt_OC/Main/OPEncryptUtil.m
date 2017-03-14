//
//  OPDEncryptUtil.m
//  Panda_Mobile_Encrypt_OC
//
//  Created by lingen on 2017/3/14.
//  Copyright © 2017年 lingen.liu. All rights reserved.
//

#import "OPEncryptUtil.h"
#import "NSData+AES.h"
#import "NSString+MD5.h"

@implementation OPEncryptUtil

+ (NSString*)encryptString:(NSString*)string key:(NSString*)key{
    NSData* data=[string dataUsingEncoding:NSUTF8StringEncoding];
    NSData* encryData = [data AESEncryptWithKey:[key MD5]];
    
    NSString *result = [encryData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return result;
}

+ (NSString*)decryptString:(NSString*)string key:(NSString*)key{
    
    NSData* data= [[NSData alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSData* decryData = [data AESDecryptWithKey:[key MD5]];
    NSString *result = [[NSString alloc] initWithData:decryData encoding:NSUTF8StringEncoding];
    return result;
}

+ (NSData*)encryptData:(NSData*)data key:(NSString*)key{
    return [data AESEncryptWithKey:[key MD5]];
    
}

+ (NSData*)decryptData:(NSData*)data key:(NSString*)key{
    return [data AESDecryptWithKey:[key MD5]];
}


@end
