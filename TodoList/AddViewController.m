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
@property (weak, nonatomic) IBOutlet UISwitch *markSwitch;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.addButton.layer.cornerRadius = 10;
    self.addButton.clipsToBounds = YES;
    self.backgroundImage.layer.cornerRadius = 10;
    self.backgroundImage.clipsToBounds = YES;
    //Fix these in a method
}

- (IBAction)addTodo:(id)sender {
    [self.model addItemToTodo:self.markSwitch.isOn andText:self.todoText.text];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
