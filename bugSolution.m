@interface MyClass : NSObject
@property (nonatomic, strong) NSString *myString;
- (void)myMethod;
@end

@implementation MyClass
- (void)myMethod {
    __weak typeof(self) weakSelf = self; // Use weak reference
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{ 
        if (weakSelf) { // Check if object is still valid
            [weakSelf.myString length];
        }
    });
}
@end