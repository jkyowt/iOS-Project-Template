//
//  DataStack.h
//  xiaoxi
//
//  Created by BB9z on 13-1-9.
//  Copyright (c) 2013年 edoctor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DataStack : NSObject
@property (RF_STRONG, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (RF_STRONG, nonatomic) NSManagedObjectContext *context;
@property (RF_STRONG, nonatomic) NSManagedObjectModel *managedObjectModel;

+ (instancetype)sharedInstance;

- (NSFetchRequest *)fetchRequestTemplateForName:(NSString *)name;
- (void)save;
@end

@interface NSManagedObjectContext (DataStack)
- (BOOL)save;
@end

@interface NSManagedObject (DataStack)
// Remove from NSManagedObjectContext
- (void)destroy;
@end
