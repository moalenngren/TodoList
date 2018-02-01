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
@end

@implementation TodoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[TodoModel alloc] init];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
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
    if(section == 0){
         return self.model.todoArray.count;
    } else {
        return self.model.doneArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];
    
    if(indexPath.section == 0){
         cell.accessoryType = UITableViewCellAccessoryNone;
        NSDictionary *item = self.model.todoArray[indexPath.row];
        cell.textLabel.text = item[@"text"];
        
        if(item[@"important"] == @(YES)){
            cell.imageView.image = [UIImage imageNamed:@"explanationmark"];
        }
        
    } else {
          cell.accessoryType = UITableViewCellAccessoryCheckmark;
        NSDictionary *item = self.model.doneArray[indexPath.row];
        cell.textLabel.text = item[@"text"];
        
        if(item[@"important"] == @(YES)){
            cell.imageView.image = [UIImage imageNamed:@"explanationmark"];
        }
    }
    return cell; 
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
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        } else {
            [self.model.doneArray removeObjectAtIndex:indexPath.row];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        
      [self.tableView reloadData];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section == 0){
            NSMutableDictionary *item = [self.model.todoArray[indexPath.row] mutableCopy];
           // UITableViewCellAccessoryCheckmark;
            [self.model.doneArray addObject:item];
            [self.model.todoArray removeObject:item];
        } else {
             NSMutableDictionary *item = [self.model.doneArray[indexPath.row] mutableCopy];
           //  UITableViewCellAccessoryNone;
             [self.model.todoArray addObject:item];
             [self.model.doneArray removeObject:item];
        }
    NSLog(@"Done array: %@", self.model.doneArray);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.tableView reloadData];
}
/*
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
} */


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"AddSegue"]){
        AddViewController *add = [segue destinationViewController];
        add.model = self.model;
    }
}

@end
