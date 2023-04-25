//
//  ViewController.h
//  SQLite_Crud
//
//  Created by Tiwari, Kanchan Kumar (Cognizant) on 16/03/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;

- (IBAction)btnSave:(UIButton *)sender;
- (IBAction)btnDelete:(UIButton *)sender;
- (IBAction)btnShow:(UIButton *)sender;
- (IBAction)btnUpdate:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITableView *tblView;
@property(strong,nonatomic)NSMutableArray *mainArrData;

@end

