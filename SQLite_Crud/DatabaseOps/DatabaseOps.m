//
//  DatabaseOps.m
//  SQLite_Crud
//
//  Created by Tiwari, Kanchan Kumar (Cognizant) on 16/03/21.
//

#import "DatabaseOps.h"

@implementation DatabaseOps
@synthesize arrData,strMain;

-(id)init{
    appDeligate = (AppDelegate *)[[UIApplication sharedApplication]delegate];    // method of appdeligate is used
    strMain = appDeligate.path;
    return self;
    
}
-(NSMutableArray *)getAllUser:(NSString *)query{
    arrData =[[NSMutableArray alloc]init];
    if(sqlite3_open([strMain UTF8String], &db)==SQLITE_OK){
        sqlite3_stmt *connection;
        if(sqlite3_prepare_v2(db, [query UTF8String], -1, &connection, nil)==SQLITE_OK){
            while (sqlite3_step(connection)==SQLITE_ROW) {
                NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                NSString *str1  = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection,0)];    //name
                
                NSString *str2 = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 1)];     // email
                NSString *str3 = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 2)];      //password
                
                [dict setObject:str1 forKey:@"name"];
                [dict setObject:str2 forKey:@"email"];
                [dict setObject:str3 forKey:@"password"];
                [arrData addObject:dict];
            }
        }
        sqlite3_finalize(connection);
    }
    sqlite3_close(db);
    return arrData;
}
@end


/*
 
 steps for connecting sqlite
    1. open
    2. prepare
    3. step
    4. Finalise
    5. close
 
 
 a. SAVE :- Insert into info values("%@",%@,%@);
 b. UPDATE :- update info set name="%@" where email="%@";
 c. delete :- delete from info where name="%@";
 d. show :- select * from info;
 
 */
