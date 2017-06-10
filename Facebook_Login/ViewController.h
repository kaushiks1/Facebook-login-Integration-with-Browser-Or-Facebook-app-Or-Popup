//
//  ViewController.h
//  Facebook_Login
//
//  Created by KaushikS on 6/9/17.
//  Copyright © 2017 Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>



@interface ViewController : UIViewController <FBSDKLoginButtonDelegate>




- (IBAction)buttonActionFacebookLoginwithSafariorFacebookApp:(id)sender;
- (IBAction)buttonActionFacebookLoginwithPopup:(id)sender;




@end

