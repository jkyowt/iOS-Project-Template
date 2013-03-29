
#import "ExampleEntity.h"

/// Core Data Entity Name
static NSString *const CDENExampleEntity = @"ExampleEntity";

/// Core Data Entity Attribute
static NSString *const CDEAUid       = @"uid";

@interface ExampleEntity (Cache)

+ (ExampleEntity *)entityWithUID:(NSString *)uid creatIfNotExist:(BOOL)creatIfNotExist;

+ (ExampleEntity *)creatEntityWithUID:(NSUInteger)uid inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;
+ (ExampleEntity *)entityWithUID:(NSUInteger)uid inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end
