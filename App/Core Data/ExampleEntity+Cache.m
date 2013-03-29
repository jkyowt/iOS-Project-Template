
#import "DataStack.h"
#import "ExampleEntity+Cache.h"

@implementation ExampleEntity (Cache)

+ (ExampleEntity *)entityWithUID:(NSString *)uid creatIfNotExist:(BOOL)creatIfNotExist {
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:CDENExampleEntity];
    request.predicate = [NSPredicate predicateWithFormat:@"uid = %@", uid];
    
    NSError *e = nil;
    NSArray *results = [[DataStack sharedInstance].context executeFetchRequest:request error:&e];
    if (e) dout_error(@"%@", e);
    
    if (results.count == 1) {
        return [results firstObject];
    }
    else if (results.count == 0) {
        if (creatIfNotExist) {
            ExampleEntity *obj = [NSEntityDescription insertNewObjectForEntityForName:CDENExampleEntity inManagedObjectContext:[DataStack sharedInstance].context];
            obj.uid = uid;
            return obj;
        }
    }
    else {
        RFAssert(false, @"存在多个UID相同的Entity");
    }
    return nil;
}

+ (ExampleEntity *)creatEntityWithUID:(NSUInteger)uid inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
    NSAssert(managedObjectContext, @"managedObjectContext can`t be nil.");
    
    ExampleEntity *item = [ExampleEntity entityWithUID:uid inManagedObjectContext:managedObjectContext];
    if (item) {
        dout_warning(@"已存在相同的UID");
        return nil;
    }
    
    item = [NSEntityDescription insertNewObjectForEntityForName:CDENExampleEntity inManagedObjectContext:managedObjectContext];
    item.uid = uid;
    return item;
}

+ (ExampleEntity *)entityWithUID:(NSUInteger)uid inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:CDENExampleEntity];
    request.predicate = [NSPredicate predicateWithFormat:@"uid = %d", uid];
    
    NSError *error = nil;
    NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
    if (error != nil) {
        dout_error(@"fetch fault")
        return nil;
    }
    
    if (results.count > 1) {
        dout_error(@"存在多个UID相同的ImageEntity")
        return nil;
    }
    else {
        return [results firstObject];
    }
}

@end
