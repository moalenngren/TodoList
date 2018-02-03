//
//  TodoTableViewController.m
//  TodoList
//
//  Created by ITHS on 2018-01-30.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

#import "TodoTableViewController.h"
#import "TodoModel.h"
#import "AddViewController.h"

@interface TodoTableViewController ()
@property (nonatomic) TodoModel *model;
@property (nonatomic) UITableViewCell *cell; 
@property (nonatomic) NSDictionary *item;
@end

@implementation TodoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[TodoModel alloc] init];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return [self.model getRows:(int)section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    self.cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];
    
    if(indexPath.section == 0){
        self.cell.accessoryType = UITableViewCellAccessoryNone;
        self.item = self.model.todoArray[indexPath.row];
    } else {
        self.cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.item = self.model.doneArray[indexPath.row];
    }
    self.cell.textLabel.text = self.item[@"text"];
    if(self.item[@"important"] == @(YES)){
        self.cell.imageView.image = [UIImage imageNamed:@"explanationmark"];
    } else {
        self.cell.imageView.image = nil;
    }
    
    return self.cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(self.model.todoArray.count == 0 && self.model.doneArray.count == 0){
        return @"";
    }
    else if (section == 0 && self.model.todoArray.count == 0){
        return @"Nothing to do, you can chill...";
    } else if (section == 0){
        return @"Todo:";
    } else if(section == 1 && self.model.doneArray.count == 0){
        return @"Nothing is done, you lazy ass...";
    } else {
        return @"Done";
    }
}

#pragma mark - Edit stuff

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if(indexPath.section == 0){
            [self.model.todoArray removeObjectAtIndex:indexPath.row];
        } else {
            [self.model.doneArray removeObjectAtIndex:indexPath.row];
        }
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    [self.tableView reloadData];
    [self.model setUserDefaults];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.model selectCell:(int)indexPath.section andIndexPath:(int)indexPath.row];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.model setUserDefaults];
    [self.tableView reloadData];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"AddSegue"]){
        AddViewController *add = [segue destinationViewController];
        add.model = self.model;
    }
}

@end
