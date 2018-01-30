//
//  TodoModel.m
//  TodoList
//
//  Created by ITHS on 2018-01-30.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

#import "TodoModel.h"

@implementation TodoModel


-(void)setTodoArray:(NSString*)text {

    [self.todoArray addObject:text];
    [self setUserDefaults];
    
}

-(void)setUserDefaults {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.todoArray forKey:@"tableViewArray"];
    [userDefaults synchronize];
}

-(NSArray*)getUserDefaults {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *tableViewArray = [userDefaults objectForKey:@"tableViewArray"];
    return tableViewArray;
}

@end
