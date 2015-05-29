//
//  AddLikeToEvent.h
//  PicnicApp
//
//  Created by Vy Systems - iOS1 on 5/29/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddLikeToEvent : NSObject
- (void)addLikeToPicture:(NSURL *)url : (NSString *) eventDetailsID : (NSString *) userid
        onSuccess:(void(^)(id response))successBlock
        onFailure:(void(^)(NSError * error)) failureBlock;

- (void)addLike:(NSURL *) url : (NSString *) eventDetailsID : (NSString *) userid
      onSuccess:(void(^)(NSData *responsedata))success
      onFailure:(void (^)(NSError *error))failureBlock;


@end
