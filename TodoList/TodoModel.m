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
        if(self.todoArray == nil){
            self.todoArray = @[].mutableCopy;
            self.doneArray = @[].mutableCopy;

        } else {
            [self getUserDefaults];
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
    self.todoArray = [userDefaultsTodo objectForKey:@"todoArray"];
    self.todoArray = [userDefaultsTodo objectForKey:@"doneArray"];
}

@end
