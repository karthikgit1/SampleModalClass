//
//  PostComment.m
//  PicnicApp
//
//  Created by Vy Systems - iOS1 on 5/29/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "PostComment.h"

@implementation PostComment

- (void)postCommentToPicture:(NSURL *)url : (NSString *) eventDetailsID : (NSString *) userid :(NSString *)comments
                   onSuccess:(void(^)(id response))successBlock
                   onFailure:(void(^)(NSError * error)) failureBlock
{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    [request setTimeoutInterval:60];
    
    NSString *boundary = @"0xKhTmLbOuNdArY"; // This is important! //NSURLConnection is very sensitive to format.
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    
        //***********USERID*************
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Disposition: form-data; name=\"user_id\"\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"8" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    //***********DATA*************
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Disposition: form-data; name=\"data\"\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"TEST LOG" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    //*************TYPE***************
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Disposition: form-data; name=\"type\"\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Test MVC" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // setting the body of the post to the reqeust
    [request setHTTPBody:body];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         
         if ([data length] > 0 && error == nil)
         {
             dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                 
                 dispatch_async(dispatch_get_main_queue(), ^{
//                     NSString* _newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                     
//                      NSLog(@"data is %@",_newStr);
                     
                     //String
                     //successBlock(_newStr);
                     
                     //nsdata
                     successBlock(data);
                 });
             });
             
         }
         else if ([data length] == 0 && error == nil)
         {
             failureBlock(error);
         }
         else if (error != nil )
         {
             failureBlock(error);
         }
         else if (error != nil)
         {
             failureBlock(error);
         }
     }];
    
    //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    //        NSError *error;
    //        NSString *urlString = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:&error];
    //
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            if (error) {
    //                failureBlock(error);
    //            } else {
    //                successBlock(urlString);
    //            }
    //        });
    //    });
    
}

- (void)postComment:(NSURL *) url : (NSString *) eventDetailsID : (NSString *) userid :(NSString *)comments
          onSuccess:(void(^)(NSData *responsedata))success
          onFailure:(void (^)(NSError *error))failureBlock
{
    [self postCommentToPicture:url :eventDetailsID : userid : comments
                 onSuccess:^(id response)
     {
         
         if ([response isKindOfClass:[NSData class]])
         {
             success((NSData *)response);
         }
     }
                 onFailure:^(NSError *error)
     {
         failureBlock(error);
     }] ;
    
}


@end

