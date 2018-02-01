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
    if(self.markSwitch.isOn){
        NSDictionary *item = @{@"text": self.todoText.text, @"done": @(NO), @"important": @(YES)};
        [self.model.todoArray insertObject:item atIndex:0];
    } else {
        NSDictionary *item = @{@"text": self.todoText.text, @"done": @(NO), @"important": @(NO)};
        [self.model.todoArray addObject:item];
    }
    
    [self.model setUserDefaults];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
