//
//  TodoModel.h
//  TodoList
//
//  Created by ITHS on 2018-01-30.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoModel : NSObject
@property (nonatomic) NSMutableArray *todoArray;
@property (nonatomic) NSMutableArray *doneArray;

-(void)getUserDefaults;
-(void)setUserDefaults;
-(void)addItemToTodo:(BOOL)b andText:(NSString*)text;

@end
