//
//  BIDGameOverScene.m
//  TextShooter
//
//  Created by JN on 2014-1-23.
//  Copyright (c) 2014 Apress. All rights reserved.
//

#import "BIDGameOverScene.h"
#import "BIDStartScene.h"

@implementation BIDGameOverScene

- (instancetype)initWithSize:(CGSize)size deathLevel:(NSUInteger)deathLevel mode:(BIDGameMode)mode {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor purpleColor];
        SKLabelNode *text = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
        text.text = (mode == BIDGameModeTutorial) ? @"All Done!" : @"Game Over";
        text.fontColor = [SKColor whiteColor];
        text.fontSize = 50;
        text.position = CGPointMake(self.frame.size.width * 0.5,
                                    self.frame.size.height * 0.6);
        [self addChild:text];

        SKLabelNode *text2 = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
        text2.text = (mode == BIDGameModeTutorial)
        ? @"Touch to continue"
        : [NSString stringWithFormat:@"Died on level %lu", (unsigned long)deathLevel];
        text2.fontColor = [SKColor whiteColor];
        text2.fontSize = 25;
        text2.position = CGPointMake(self.frame.size.width * 0.5,
                                    self.frame.size.height * 0.3);
        [self addChild:text2];
}
    return self;
}

- (void)didMoveToView:(SKView *)view {
    [self performSelector:@selector(goToStart) withObject:nil afterDelay:3.0];
}

- (void)goToStart {
    SKTransition *transition = [SKTransition flipVerticalWithDuration:1.0];
    SKScene *start = [[BIDStartScene alloc] initWithSize:self.frame.size];
    [self.view presentScene:start transition:transition];
}

@end
