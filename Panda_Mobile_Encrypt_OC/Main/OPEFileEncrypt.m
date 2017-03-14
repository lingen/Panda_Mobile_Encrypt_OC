//
//  OPEFileEncrypt.m
//  Panda_Mobile_Encrypt_OC
//
//  Created by lingen on 2017/3/14.
//  Copyright © 2017年 lingen.liu. All rights reserved.
//

#import "OPEFileEncrypt.h"
#import "OPEncryptUtil.h"
#import "OPEMD5Util.h"
#import <AssetsLibrary/AssetsLibrary.h>

static NSString* OPE_CACHE_ENCRYPT = @"53C82EBA31F6D416F331DE9162EBE997";

static NSString* TIM_KEY = @"";
@implementation OPEFileEncrypt

+(BOOL)encryptLocalPath:(NSString*)localPath encryptKey:(NSString*)encryptKey{
    if (!localPath) {
        return NO;
    }
    NSData* data = [NSData dataWithContentsOfFile:localPath options:NSDataReadingMappedIfSafe error:nil];
    
    [OPEFileEncrypt p_createEncryptDirIfNesscery];
    
    NSString* cacheFile = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:OPE_CACHE_ENCRYPT] stringByAppendingPathComponent:[NSUUID UUID].UUIDString];
    
    NSData* encryptData = [OPEncryptUtil encryptData:data key:encryptKey];
    BOOL success =  [encryptData writeToFile:cacheFile atomically:YES];
    NSError* error = nil;
    success = [[NSFileManager defaultManager] removeItemAtPath:localPath error:&error];
    success = [[NSFileManager defaultManager] moveItemAtPath:cacheFile toPath:localPath error:&error];
    
    return success;
}

+(NSData*)encryptDataOfData:(NSData*)data encryptKey:(NSString*)encryptKey{
    NSData* encryptData = [OPEncryptUtil encryptData:data key:encryptKey];
    return encryptData;
}

+(NSString*)decryptLocalPath:(NSString*)localPath encryptKey:(NSString*)encryptKey{
    return [OPEFileEncrypt decryptLocalPath:localPath uuid:nil suffix:nil encryptKey:encryptKey];
}

+(NSString*)decryptLocalPath:(NSString*)localPath uuid:(NSString*)uuid suffix:(NSString*)suffix encryptKey:(NSString*)encryptKey;
{
    if (!localPath) {
        return nil;
    }
    
    if (!uuid) {
        uuid = [[NSUUID UUID] UUIDString];
    }
    
    [OPEFileEncrypt p_createEncryptDirIfNesscery];
    
    NSString* cacheFile = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:OPE_CACHE_ENCRYPT] stringByAppendingPathComponent:uuid];
    
    if (suffix) {
        cacheFile = [cacheFile stringByAppendingPathExtension:suffix];
    }
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:cacheFile]) {
        return cacheFile;
    }
    
    NSData* data = [NSData dataWithContentsOfFile:localPath options:NSDataReadingMappedIfSafe error:nil];
    NSData* decryptData = [OPEncryptUtil decryptData:data key:encryptKey];
    BOOL success =  [decryptData writeToFile:cacheFile atomically:YES];
    if (success) {
        return cacheFile;
    }
    return localPath;
}

+(NSData*)dataOfLocalPath:(NSString*)localPath encryptKey:(NSString*)encryptKey{
    NSData* data = [NSData dataWithContentsOfFile:localPath options:NSDataReadingMappedIfSafe error:nil];
    data = [OPEncryptUtil decryptData:data key:encryptKey];
    return data;
}

+(void)p_createEncryptDirIfNesscery{
    NSString* encryptCacheFile = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:OPE_CACHE_ENCRYPT];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:encryptCacheFile]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:encryptCacheFile withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

+(void)removeCacheDir{
    NSString* encryptCacheFile = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:OPE_CACHE_ENCRYPT];
    
    [[NSFileManager defaultManager] removeItemAtPath:encryptCacheFile error:nil];
    
    NSArray* tmpDirectory = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:NSTemporaryDirectory() error:NULL];
    for (NSString *file in tmpDirectory) {
        [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@%@", NSTemporaryDirectory(), file] error:NULL];
    }
}


@end
