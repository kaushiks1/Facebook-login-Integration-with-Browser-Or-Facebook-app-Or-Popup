//
//  ViewController.m
//  Facebook_Login
//
//  Created by KaushikS on 6/9/17.
//  Copyright © 2017 Leo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    //Check if User loggedin with FB or not
    if ([FBSDKAccessToken currentAccessToken]) {
        NSLog(@"Account Logged in with FB");
    }
    else{
        NSLog(@"Please Login with FB");
    }

    FBSDKLoginButton *facebookLoginButton = [[FBSDKLoginButton alloc] init];
    facebookLoginButton.frame = CGRectMake(100, 100, 300, 50);
    facebookLoginButton.delegate = self;
    [self.view addSubview:facebookLoginButton];


    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)buttonActionFacebookLoginwithSafariorFacebookApp:(id)sender {
    FBSDKLoginManager *fBSDKLoginManager = [[FBSDKLoginManager alloc]init];
    fBSDKLoginManager.loginBehavior = FBSDKLoginBehaviorBrowser;
    [fBSDKLoginManager logInWithReadPermissions:@[@"email"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }
        else if (result.isCancelled) {
            NSLog(@"result isCancelled");
        }
        else {
            NSString *stringToken = result.token.tokenString;
            if ([result.grantedPermissions containsObject:@"email"]) {
                [[[FBSDKGraphRequest alloc]initWithGraphPath:@"me" parameters:@{@"fields":@"id, name, first_name, last_name, gender, picture.type(large), email"}]
                 startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                     if (!error) {
                         NSLog(@"%@",result);
                         NSMutableDictionary *dictionaryFbSDKResponce = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                                                                         stringToken,@"toekn",
                                                                         [result valueForKey:@"id"],@"id",
                                                                         [result valueForKey:@"name"],@"name",
                                                                         [result valueForKey:@"first_name"],@"first_name",
                                                                         [result valueForKey:@"last_name"],@"last_name",
                                                                         [result valueForKey:@"gender"],@"gender",
                                                                         [result valueForKeyPath:@"picture.data.url"],@"picture",
                                                                         [result valueForKey:@"email"],@"email", nil];
                         NSLog(@"%@",dictionaryFbSDKResponce);
                         //Navigate to HomeScreenViewController
                     }
                     else {
                         NSLog(@"%@",[error localizedDescription]);
                         NSLog(@"%@",error);
                     }
                 }];
            }
        }
    }];
}



- (IBAction)buttonActionFacebookLoginwithPopup:(id)sender {
    FBSDKLoginManager *fBSDKLoginManager = [[FBSDKLoginManager alloc]init];
    fBSDKLoginManager.loginBehavior = FBSDKLoginBehaviorWeb;
    [fBSDKLoginManager logInWithReadPermissions:@[@"email"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }
        else if (result.isCancelled) {
            NSLog(@"result isCancelled");
        }
        else {
            NSString *stringToken = result.token.tokenString;
            if ([result.grantedPermissions containsObject:@"email"]) {
                [[[FBSDKGraphRequest alloc]initWithGraphPath:@"me" parameters:@{@"fields":@"id, name, first_name, last_name, gender, picture.type(large), email"}]
                 startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                     if (!error) {
                         NSLog(@"%@",result);
                         NSMutableDictionary *dictionaryFbSDKResponce = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                                                                         stringToken,@"toekn",
                                                                         [result valueForKey:@"id"],@"id",
                                                                         [result valueForKey:@"name"],@"name",
                                                                         [result valueForKey:@"first_name"],@"first_name",
                                                                         [result valueForKey:@"last_name"],@"last_name",
                                                                         [result valueForKey:@"gender"],@"gender",
                                                                         [result valueForKeyPath:@"picture.data.url"],@"picture",
                                                                         [result valueForKey:@"email"],@"email", nil];
                         NSLog(@"%@",dictionaryFbSDKResponce);
                         //Navigate to HomeScreenViewController
                     }
                     else {
                         NSLog(@"%@",[error localizedDescription]);
                         NSLog(@"%@",error);
                     }
                 }];
            }
        }
    }];
}



#pragma mark - FBSDKLoginButtonDelegate
- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    //After Secessful login this method will fire
    NSLog(@"%@",loginButton);
    NSLog(@"%@",result);
    NSLog(@"%@",error);

    if (error) {
        NSLog(@"%@",error);
    }
    else if (result.isCancelled) {
        NSLog(@"result isCancelled");
    }
    else {
        NSString *stringToken = result.token.tokenString;
        if ([result.grantedPermissions containsObject:@"email"]) {
            [[[FBSDKGraphRequest alloc]initWithGraphPath:@"me" parameters:@{@"fields":@"id, name, first_name, last_name, gender, picture.type(large), email"}]
             startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                 if (!error) {
                     NSLog(@"%@",result);
                     NSMutableDictionary *dictionaryFbSDKResponce = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                                                                     stringToken,@"toekn",
                                                                     [result valueForKey:@"id"],@"id",
                                                                     [result valueForKey:@"name"],@"name",
                                                                     [result valueForKey:@"first_name"],@"first_name",
                                                                     [result valueForKey:@"last_name"],@"last_name",
                                                                     [result valueForKey:@"gender"],@"gender",
                                                                     [result valueForKeyPath:@"picture.data.url"],@"picture",
                                                                     [result valueForKey:@"email"],@"email", nil];
                     NSLog(@"%@",dictionaryFbSDKResponce);
                     //Navigate to HomeScreenViewController
                 }
                 else {
                     NSLog(@"%@",[error localizedDescription]);
                     NSLog(@"%@",error);
                 }
             }];
        }
    }

}



- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    // After Logout button this method will fire
    NSLog(@"%@",loginButton);
}



- (BOOL) loginButtonWillLogin:(FBSDKLoginButton *)loginButton {
    //Before Login and Logout button this method will fire
    //Enable Or Desable Facebook Login
    NSLog(@"%@",loginButton);
    return true;
}





@end
