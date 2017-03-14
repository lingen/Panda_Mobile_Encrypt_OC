This library is an encrypt library for Objective-C

It use AES method to encrypt  **String** or **File**

## How to import the library

you can import the library use cocoapods:

~~~

~~~

or  

you can download the project source and compile a framework for you;

## How to use

### Encrypt or decrypt string or data

you can use ***OPEncryptUtil*** class for encrypt or decrypt for string or data,it's provider four methods :

~~~objective-c
+ (NSString*)encryptString:(NSString*)string key:(NSString*)key;

+ (NSString*)decryptString:(NSString*)string key:(NSString*)key;

+ (NSData*)encryptData:(NSData*)data key:(NSString*)key;

+ (NSData*)decryptData:(NSData*)data key:(NSString*)key;
~~~

### Encrypt or decrypt file

sometimes you want encrypt or descrypt for a file in app, This library also support it;

you can use ***OPEFileEncrypt*** class for file encrypt or descrypt action

~~~objective-c
+(BOOL)encryptLocalPath:(NSString*)localPath encryptKey:(NSString*)encryptKey;

+(NSData*)dataOfLocalPath:(NSString*)localPath encryptKey:(NSString*)encryptKey;

+(NSData*)encryptDataOfData:(NSData*)data encryptKey:(NSString*)encryptKey;

+(NSString*)decryptLocalPath:(NSString*)localPath encryptKey:(NSString*)encryptKey;

+(NSString*)decryptLocalPath:(NSString*)localPath uuid:(NSString*)uuid suffix:(NSString*)suffix encryptKey:(NSString*)encryptKey;

+(void)removeCacheDir;
~~~

That it;