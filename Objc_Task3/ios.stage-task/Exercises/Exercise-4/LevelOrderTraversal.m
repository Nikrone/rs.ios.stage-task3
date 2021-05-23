#import "LevelOrderTraversal.h"

int CurrentIndex = 0;

@interface BinaryNode : NSObject

@property NSNumber *value;
@property BinaryNode *leftNode;
@property BinaryNode *rightNode;

- (BinaryNode *)initWithValue:(NSNumber *)value;
- (BinaryNode *)getBinaryTreeFromPreorderTraversal:(NSArray *) preorderTraversal;
- (NSMutableArray *)getLevelTraversal;

@end

@implementation BinaryNode

- (BinaryNode *)initWithValue:(NSNumber *)value {
    
    self = [super init];
    if (self != nil) {
        self.value = value;
        self.leftNode = NULL;
        self.rightNode = NULL;
    }
    return self;
}

- (BinaryNode *)getBinaryTreeFromPreorderTraversal:(NSArray *)preorderTraversal {
    
    if ([preorderTraversal count] <= CurrentIndex || preorderTraversal[CurrentIndex] == [NSNull null]) {
        return nil;
    }
    BinaryNode *root = [[BinaryNode alloc] initWithValue: preorderTraversal[CurrentIndex]];
    
    CurrentIndex += 1;
    root.leftNode = [[BinaryNode alloc] getBinaryTreeFromPreorderTraversal: preorderTraversal];
    
    CurrentIndex += 1;
    root.rightNode = [[BinaryNode alloc] getBinaryTreeFromPreorderTraversal: preorderTraversal];
    
    return root;
}

- (NSMutableArray *)getLevelTraversal {
    
    NSMutableArray *levelTraversal = [[NSMutableArray alloc] initWithObjects:[[NSMutableArray alloc] initWithObjects: self.value, nil], nil];
    
    if (self.leftNode != nil) {
        
        NSArray *left = self.leftNode.getLevelTraversal;
        for (int i = 0; i < left.count; ++i) {
            if (i < levelTraversal.count - 1) {
                [levelTraversal[i + 1] addObjectsFromArray:left[i]];
            } else {
                [levelTraversal addObject: left[i]];
            }
        }
    }
    
    if (self.rightNode != nil) {
        
        NSArray *right = self.rightNode.getLevelTraversal;
        for (int i = 0; i < right.count; ++i) {
            if (i < levelTraversal.count - 1) {
                [levelTraversal[i + 1] addObjectsFromArray:right[i]];
            } else {
                [levelTraversal addObject: right[i]];
            }
        }
    }
    
    return levelTraversal;
}

@end



NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    
    CurrentIndex = 0;
    BinaryNode *binaryTree = [[BinaryNode alloc] getBinaryTreeFromPreorderTraversal:tree];
    
    if (binaryTree != nil) {
        return [binaryTree getLevelTraversal];
    } else {
        return @[];
    }
}
