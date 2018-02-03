//
//  AddViewController.m
//  TodoList
//
//  Created by ITHS on 2018-01-30.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

#import "AddViewController.h"


@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *todoText;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage2;
@property (weak, nonatomic) IBOutlet UILabel *deleteLabel;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UISwitch *markSwitch;
@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.deleteLabel.text = @"Delete all items in the list";
    self.backgroundImage2.layer.cornerRadius = 10;
    self.backgroundImage2.clipsToBounds = YES;
    self.addButton.layer.cornerRadius = 10;
    self.addButton.clipsToBounds = YES;
    self.backgroundImage.layer.cornerRadius = 10;
    self.backgroundImage.clipsToBounds = YES;
    self.deleteButton.layer.cornerRadius = 10;
    self.deleteButton.clipsToBounds = YES;
}

- (IBAction)addTodo:(id)sender {
    [self.model addItemToTodo:self.markSwitch.isOn andText:self.todoText.text];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)deleteButton:(id)sender {
    self.deleteLabel.text = @"All items in list are deleted";
    [self.model deleteAllItems];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
