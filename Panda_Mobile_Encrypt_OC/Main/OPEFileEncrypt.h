//
//  OPEFileEncrypt.h
//  Panda_Mobile_Encrypt_OC
//
//  Created by lingen on 2017/3/14.
//  Copyright © 2017年 lingen.liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OPEFileEncrypt : NSObject

+(BOOL)encryptLocalPath:(NSString*)localPath encryptKey:(NSString*)encryptKey;

+(NSData*)dataOfLocalPath:(NSString*)localPath encryptKey:(NSString*)encryptKey;

+(NSData*)encryptDataOfData:(NSData*)data encryptKey:(NSString*)encryptKey;

+(NSString*)decryptLocalPath:(NSString*)localPath encryptKey:(NSString*)encryptKey;

+(NSString*)decryptLocalPath:(NSString*)localPath uuid:(NSString*)uuid suffix:(NSString*)suffix encryptKey:(NSString*)encryptKey;

+(void)removeCacheDir;

@end
