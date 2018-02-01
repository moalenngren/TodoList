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
            [self getUserDefaultsTodo];
        }
    }
    return self;
}

-(NSArray*)getAllDone {
    NSMutableArray *done = @[].mutableCopy;
    for(int i = 0; 0 < self.doneArray; i++){
        
        NSDictionary *item = self.todoArray[i];
        if([item[@"done"] boolValue]){
            [done addObject:self.doneArray[i]];
        }
    }
    return done;
}

-(NSInteger)getNumberOfDone {
    return [self getAllDone].count;
}

-(void)setUserDefaultsTodo {
    NSUserDefaults *userDefaultsTodo = [NSUserDefaults standardUserDefaults];
    [userDefaultsTodo setObject:self.todoArray forKey:@"todoArray"];
      [userDefaultsTodo setObject:self.doneArray forKey:@"doneArray"];
    [userDefaultsTodo synchronize];
}

-(void)getUserDefaultsTodo {
    
    NSUserDefaults *userDefaultsTodo = [NSUserDefaults standardUserDefaults];
    self.todoArray = [userDefaultsTodo objectForKey:@"todoArray"];
}

@end
