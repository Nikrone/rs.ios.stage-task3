#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSString *result = [[NSString alloc] init];
    NSMutableArray<NSString *> *string1A = [[NSMutableArray alloc] init];
    NSMutableArray<NSString *> *string2A = [[NSMutableArray alloc] init];
    int i;
    for (i = 0; i < [string1 length]; i++) {
        [string1A addObject:[NSString stringWithFormat:@"%c",[string1 characterAtIndex:i]]];
    }
    int j;
    for (j = 0; j < [string2 length]; j++) {
        [string2A addObject:[NSString stringWithFormat:@"%c",[string2 characterAtIndex:j]]];
    }
    do {
        if ([string1A firstObject] == nil && [string2A firstObject] != nil) {
            result = [result stringByAppendingString:string2A[0]];
            [string2A removeObjectAtIndex:0];
        } else if ([string2A firstObject] == nil && [string1A firstObject] != nil) {
            result = [result stringByAppendingString:string1A[0]];
            [string1A removeObjectAtIndex:0];
        } else {
            if ([string1A[0] compare:string2A[0] options:NSCaseInsensitiveSearch] == NSOrderedDescending) {
                result = [result stringByAppendingString:string2A[0]];
                [string2A removeObjectAtIndex:0];
            } else {
                result = [result stringByAppendingString:string1A[0]];
                [string1A removeObjectAtIndex:0];
            }
        }
    } while ([string1A count] > 0 || [string2A count] > 0);
    return result;
}

@end
