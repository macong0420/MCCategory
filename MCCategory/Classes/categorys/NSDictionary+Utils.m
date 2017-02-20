//
//  NSDictionary+Utils.m
//  MCCategory
//
//  Created by mcc on 2017/2/20.
//  Copyright © 2017年 mcc. All rights reserved.
//

#import "NSDictionary+Utils.h"

@implementation NSDictionary (Utils)

//return an empty string if the value is null or not a string.
- (NSString *)stringForKey:(id)key
{
    NSString *result = [self objectForKey:key];
    if([result isKindOfClass:[NSString class]])
    {
        return result;
    }
    else {
        return @"";
    }
}

-(BOOL) boolForKey:(id)key {
    id result = [self objectForKey:key];
    if ([result isKindOfClass:[NSNumber class]]) {
        return [result boolValue];
    }
    else {
        return false;
    }
}

-(NSInteger) intergerForKey:(id)key {
    id result = [self objectForKey:key];
    if ([result isKindOfClass:[NSNumber class]]) {
        return [result integerValue];
    }
    else {
        return -1;
    }
}

-(NSInteger) PRIntergerForKey:(id)key {
    id result = [self objectForKey:key];
    if ([result isKindOfClass:[NSNumber class]]) {
        return [result integerValue];
    }
    else {
        return 0;
    }
}

//return nil if the object is null or not a NSDictionary.
- (NSDictionary *)dictionaryForKey:(id)key
{
    NSDictionary *result = [self objectForKey:key];
    if([result isKindOfClass:[NSDictionary class]])
    {
        return result;
    }
    else {
        return nil;
    }
}

//return nil if the object is null or not a NSArray.
- (NSArray *)arrayForKey:(id)key
{
    NSArray *result = [self objectForKey:key];
    if([result isKindOfClass:[NSArray class]])
    {
        return result;
    }
    else {
        return nil;
    }
}

+(NSDictionary *) dictionaryWithData:(NSData *) data
{
    
    NSError *resDictionaryError = nil;
    NSDictionary *resDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&resDictionaryError];
    if (resDictionaryError) {
        return nil;
    }else {
        if ([resDictionary isKindOfClass:[NSDictionary class]]) {
            return resDictionary;
        }
        return nil;
    }
    
}


@end
