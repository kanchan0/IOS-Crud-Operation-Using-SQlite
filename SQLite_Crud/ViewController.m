//
//  ViewController.m
//  SQLite_Crud
//
//  Created by Tiwari, Kanchan Kumar (Cognizant) on 16/03/21.
//

#import "ViewController.h"
#import "DatabaseOps/DatabaseOps.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize mainArrData,txtName,txtEmail,txtPassword,tblView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)btnUpdate:(UIButton *)sender {
    NSString *strupdate= [[NSString alloc]initWithFormat:@"update signup_details set name='%@' where email='%@'",txtName.text,txtEmail.text];
    DatabaseOps *dops = [[DatabaseOps alloc]init];
    BOOL st =[dops getAllUser:strupdate];
    if(st){
        NSLog(@"data is UPDATED sucessfully");
    }else{
        NSLog(@"data is not updated,some error occured");
    }
}

- (IBAction)btnShow:(UIButton *)sender {
    NSString *strShow = [[NSString alloc]initWithFormat:@"select * from signup_details"];
    DatabaseOps *dops = [[DatabaseOps alloc]init];
    mainArrData =[[NSMutableArray alloc]init];
    mainArrData=[dops getAllUser:strShow];
    [tblView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return mainArrData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tblView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [[mainArrData objectAtIndex:indexPath.row]objectForKey:@"name"];
    cell.detailTextLabel.text =[[mainArrData objectAtIndex:indexPath.row]objectForKey:@"email"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    txtName.text = [[mainArrData objectAtIndex:indexPath.row]objectForKey:@"name"];
    txtEmail.text = [[mainArrData objectAtIndex:indexPath.row]objectForKey:@"email"];
}

- (IBAction)btnDelete:(UIButton *)sender {
    NSString *strdelete = [[NSString alloc]initWithFormat:@"delete from signup_details where email='%@'",txtEmail.text];
    DatabaseOps *dops = [[DatabaseOps alloc]init];
    BOOL st =[dops getAllUser:strdelete];
    if(st){
        NSLog(@"data is deleted sucessfully");
    }else{
        NSLog(@"data is not deleted,some error occured");
    }
}

- (IBAction)btnSave:(UIButton *)sender {
    NSString *strsave = [[NSString alloc]initWithFormat:@"insert into signup_details values('%@','%@','%@')",txtName.text,txtEmail.text,txtPassword.text];
    DatabaseOps *dops = [[DatabaseOps alloc]init];
    BOOL st =[dops getAllUser:strsave];
    if(st){
        NSLog(@"data is inserted sucessfully");
    }else{
        NSLog(@"data is not saved,some error occured");
    }
    
}
@end
