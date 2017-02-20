//
//  NSDictionary+Utils.h
//  MCCategory
//
//  Created by mcc on 2017/2/20.
//  Copyright © 2017年 mcc. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kEmptyString;

@interface NSDictionary (Utils)

// return an empty string if the value is NSNull or not a string.
- (NSString *)stringForKey:(id)key;

//return nil if the object is NSNull or not a NSDictionary
- (NSDictionary *)dictionaryForKey:(id)key;

//return nil if the object is null or not a NSArray.
- (NSArray *)arrayForKey:(id)key;

- (BOOL)boolForKey:(id)key;

-(NSInteger) intergerForKey:(id)key;

-(NSInteger) PRIntergerForKey:(id)key;

+(NSDictionary *) dictionaryWithData:(NSData *) data;
@end
