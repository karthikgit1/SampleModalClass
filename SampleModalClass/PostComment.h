//
//  PostComment.h
//  PicnicApp
//
//  Created by Vy Systems - iOS1 on 5/29/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostComment : NSObject

- (void)postCommentToPicture:(NSURL *)url : (NSString *) eventDetailsID : (NSString *) userid :(NSString *)comments
               onSuccess:(void(^)(id response))successBlock
               onFailure:(void(^)(NSError * error)) failureBlock;


- (void)postComment:(NSURL *) url : (NSString *) eventDetailsID : (NSString *) userid :(NSString *)comments
          onSuccess:(void(^)(NSData *responsedata))success
          onFailure:(void (^)(NSError *error))failureBlock;
@end
