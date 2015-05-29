//
//  ViewController.m
//  SampleModalClass
//
//  Created by Vy Systems - iOS1 on 5/29/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "ViewController.h"
#import "PostComment.h"
#import "AddLikeToEvent.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btn1Action:(id)sender
{
    PostComment *postcmt = [[PostComment alloc] init];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"****YOUR URL****"]];

    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    
    [postcmt postComment:url :@"8" :@"8" :@"8"
               onSuccess:^(NSData* responseData)
     {
         //********Hide Spinner*********//
         [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
         
         NSString* _newStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
         
         NSLog(@"data is %@",_newStr);
         
         
     } onFailure:^(NSError* error)
     {
         //********Hide Spinner*********//
         [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
         
         dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
             
             
             dispatch_async(dispatch_get_main_queue(), ^{
                [[[UIAlertView alloc] initWithTitle:@"error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"dissmiss" otherButtonTitles: nil] show];
             });
         });

         
         
     }];

}


- (IBAction)btn2Action:(id)sender
{
    AddLikeToEvent *addLikeToEvent = [[AddLikeToEvent alloc] init];
    
    
     NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"****YOUR URL****"]];
    
[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [addLikeToEvent addLike:url : @"8" : @"8"
                  onSuccess:^(NSData* responseData)
     {
         //********Hide Spinner*********//
         [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
         
         NSString* _newStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
         
         NSLog(@"data is %@",_newStr);
         
         
     } onFailure:^(NSError* error)
     {
         //********Hide Spinner*********//
         [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
         
         dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
             
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 [[[UIAlertView alloc] initWithTitle:@"error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"dissmiss" otherButtonTitles: nil] show];
             });
         });
         
         
         
     }];

}

@end
