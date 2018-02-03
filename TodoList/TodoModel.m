//
//  TodoModel.m
//  TodoList
//
//  Created by ITHS on 2018-01-30.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

#import "TodoModel.h"

@implementation TodoModel

-(instancetype)init {
    self = [super init];
    if (self) {
        [self getUserDefaults];
        if(self.todoArray == nil){
            self.todoArray = @[].mutableCopy;
        }
        if(self.doneArray == nil) {
            self.doneArray = @[].mutableCopy;
        }
    }
    return self;
}

-(void)setUserDefaults {
    NSUserDefaults *userDefaultsTodo = [NSUserDefaults standardUserDefaults];
    [userDefaultsTodo setObject:self.todoArray forKey:@"todoArray"];
    [userDefaultsTodo setObject:self.doneArray forKey:@"doneArray"];
    [userDefaultsTodo synchronize];
}

-(void)getUserDefaults {
    NSUserDefaults *userDefaultsTodo = [NSUserDefaults standardUserDefaults];
    self.todoArray = [[userDefaultsTodo objectForKey:@"todoArray"] mutableCopy];
    self.doneArray = [[userDefaultsTodo objectForKey:@"doneArray"] mutableCopy];
}

-(void)addItemToTodo:(BOOL)b andText:(NSString*)text {
    if(b){
        NSDictionary *item = @{@"text": text, @"important": @(YES)};
        [self.todoArray insertObject:item atIndex:0];
    } else {
        NSDictionary *item = @{@"text": text, @"important": @(NO)};
        [self.todoArray addObject:item];
    }
    [self setUserDefaults];
}

-(int)getRows:(int)section {
    if(section == 0){
        return (int)self.todoArray.count;
    } else {
        return (int)self.doneArray.count;
    }
}

-(void)deleteAllItems{
    self.todoArray = @[].mutableCopy;
    self.doneArray = @[].mutableCopy;
     [self setUserDefaults];
}

-(void)selectCell:(int)section andIndexPath:(int)nr {
    
    if(section == 0){
        NSDictionary *item = self.todoArray[nr];
        [self.doneArray addObject:item];
        [self.todoArray removeObject:item];
    } else {
        NSDictionary *item = self.doneArray[nr];
        [self.todoArray addObject:item];
        [self.doneArray removeObject:item];
    }
}

@end
