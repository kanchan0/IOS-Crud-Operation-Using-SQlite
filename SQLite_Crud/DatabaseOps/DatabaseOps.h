//
//  DatabaseOps.h
//  SQLite_Crud
//
//  Created by Tiwari, Kanchan Kumar (Cognizant) on 16/03/21.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import <sqlite3.h>

@interface DatabaseOps : NSObject{
    AppDelegate *appDeligate;
    sqlite3 *db;
}
@property(strong,nonatomic)NSMutableArray *arrData;
@property(strong,nonatomic)NSString *strMain;
-(NSMutableArray *)getAllUser:(NSString *)query;

@end


