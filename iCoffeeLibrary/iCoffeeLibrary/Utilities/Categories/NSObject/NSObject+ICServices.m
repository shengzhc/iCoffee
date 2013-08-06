//
//  NSObject+ICServices.m
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/14/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "NSObject+ICServices.h"
#import "ICLog.h"

@implementation NSObject (ICServices)

- (NSInvocation *)invocationForSelector:(SEL)selector
                                argList:(va_list)argList
                              parameter:(void *)parameter
{
    if ([self respondsToSelector:selector])
    {
        NSMethodSignature *methodSignature = [self methodSignatureForSelector:selector];
        if (!methodSignature)
        {
            ICDebugLog(@"No method signature, %s, for object %@. Cannot execute.", sel_getName(selector), self);
            return nil;
        }
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
        [invocation retainArguments];
        
        [invocation setTarget:self];
        [invocation setSelector:selector];
        [invocation retainArguments];
        
        void *currentObject = parameter;
        
        for (NSUInteger i = 2; i < [methodSignature numberOfArguments]; i++)
        {
            [invocation setArgument:&currentObject
                            atIndex:i];
            currentObject = va_arg(argList, void *);
        }
        
        return invocation;
    }
    return nil;
}

- (NSInvocation *)invocationForSelector:(SEL)selector
                            withObjects:(NSObject *)objects, ...
{
    va_list arg_list;
    va_start(arg_list, objects);
    
    NSInvocation *invocation = [self invocationForSelector:selector
                                                   argList:arg_list
                                                 parameter:(__bridge  void*)objects];
    
    va_end(arg_list);
    
    return invocation;
}

- (void)attemptPerformSelector:(SEL)selector
{
    NSInvocation *invocation = [self invocationForSelector:selector
                                               withObjects:nil];
    [invocation performSelector:@selector(invoke)];
}

- (void)attemptPerformSelector:(SEL)selector
                    withObject:(id)object
{
    NSInvocation *invocation = [self invocationForSelector:selector
                                               withObjects:object, nil];
    [invocation performSelector:@selector(invoke)];
}

- (void)attemptPerformSelector:(SEL)selector
                   withObjects:(NSObject *)objects, ...
{
    va_list arg_list;
    va_start(arg_list, objects);
    
    NSInvocation *invocation = [self invocationForSelector:selector
                                                   argList:arg_list
                                                 parameter:(__bridge void *)objects];
    
    va_end(arg_list);
    [invocation performSelector:@selector(invoke)];
}

- (void)attemptPerformSelectorInBackground:(SEL)selector
{
    NSInvocation *invocation = [self invocationForSelector:selector
                                               withObjects:nil];
    [invocation performSelectorInBackground:@selector(invoke)
                                 withObject:nil];
}

- (void)attemptPerformSelectorInBackground:(SEL)selector
                                withObject:(id)object
{
    NSInvocation *invocation = [self invocationForSelector:selector
                                               withObjects:object, nil];
    [invocation performSelectorInBackground:@selector(invoke)
                                 withObject:nil];
}

- (void)attemptPerformSelectorInBackground:(SEL)selector
                               withObjects:(NSObject *)objects, ...
{
    va_list arg_list;
    va_start(arg_list, objects);
    
    NSInvocation *invocation = [self invocationForSelector:selector
                                                   argList:arg_list
                                                 parameter:(__bridge void *)objects];
    
    va_end(arg_list);
    
    [invocation performSelectorInBackground:@selector(invoke)
                                 withObject:nil];
}

- (void)attemptPerformSelectorOnMainThread:(SEL)selector
{
    NSInvocation *invocation = [self invocationForSelector:selector
                                               withObjects:nil];
    [invocation performSelectorOnMainThread:@selector(invoke)
                                 withObject:nil
                              waitUntilDone:NO];
}

- (void)attemptPerformSelectorOnMainThread:(SEL)selector
                                withObject:(NSObject *)object
{
    NSInvocation *invocation = [self invocationForSelector:selector
                                               withObjects:object, nil];
    
    [invocation performSelectorOnMainThread:@selector(invoke)
                                 withObject:nil
                              waitUntilDone:NO];
}

- (void)attemptPerformSelectorOnMainThread:(SEL)selector
                               withObjects:(NSObject *)objects, ...
{
    va_list arg_list;
    va_start(arg_list, objects);
    
    NSInvocation *invocation = [self invocationForSelector:selector
                                                   argList:arg_list
                                                 parameter:(__bridge void *)objects];
    va_end(arg_list);
    
    [invocation performSelectorOnMainThread:@selector(invoke)
                                 withObject:nil
                              waitUntilDone:NO];
}


- (void)attemptPerformSelector:(SEL)selector
                    withObject:(id)object
                    afterDelay:(float)delay
{
    NSInvocation *invocation = [self invocationForSelector:selector
                                               withObjects:object, nil];
    
    [invocation performSelector:@selector(invoke)
                     withObject:nil
                     afterDelay:delay];
}

@end
