//
//  AppDelegate.m
//  SQLite_Crud
//
//  Created by Tiwari, Kanchan Kumar (Cognizant) on 16/03/21.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize path;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self copyAndPaste];
    
    return YES;
}

-(void)copyAndPaste{
    NSArray *arr1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *str1 = [arr1 objectAtIndex:0];
    path = [str1 stringByAppendingPathComponent:@"Test_Database.db"];
    if(![[NSFileManager defaultManager]fileExistsAtPath:path]){
        NSString *local = [[NSBundle mainBundle]pathForResource:@"Test_Database" ofType:@"db"];
        [[NSFileManager defaultManager]copyItemAtPath:local toPath:path error:nil];
    }
    NSLog(@"%@",path);
}
#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
