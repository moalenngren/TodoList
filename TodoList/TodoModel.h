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

-(void)setTodoArray:(NSString*)text;

@end
