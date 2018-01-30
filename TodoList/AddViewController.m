//
//  AddViewController.m
//  TodoList
//
//  Created by ITHS on 2018-01-30.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

#import "AddViewController.h"
#import "TodoModel.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *todoText;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (nonatomic) TodoModel *model;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[TodoModel alloc] init];
    self.addButton.layer.cornerRadius = 10;
    self.addButton.clipsToBounds = YES;
    self.backgroundImage.layer.cornerRadius = 10;
    self.backgroundImage.clipsToBounds = YES;
    //Fix these in a method
}

- (IBAction)addTodo:(id)sender {
  //  [self.todoArray addObject:self.todoText.text];
    [self.model setTodoArray:self.todoText.text];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
