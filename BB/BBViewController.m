//
//  MCViewController.m
//  blah
//
//  Created by Jeff LaMarche on 9/6/11.
//  Copyright (c) 2011 MartianCraft. All rights reserved.
//

#import "BBViewController.h"
#import "monkey.h"

@interface BBViewController ()
{    
    GLKMatrix4 modelViewProjectionMatrix;
    GLKMatrix3 normalMatrix;
    float rotation;
    
    GLuint vertexArray;
    GLuint vertexBuffer;
}

@property (strong, nonatomic) GLKReflectionMapEffect *effect;
@property (strong, nonatomic) GLKTextureInfo *cubemap;
@property (strong, nonatomic) GLKSkyboxEffect *skyboxEffect;
@property (strong, nonatomic) EAGLContext *context;
- (void)setupGL;
- (void)tearDownGL;
@end

@implementation BBViewController

@synthesize context = _context;
@synthesize effect = _effect;
@synthesize cubemap = _cubemap;
@synthesize skyboxEffect = _skyboxEffect;
@synthesize gameController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];

    if (!self.context) {
        NSLog(@"Failed to create ES context");
    }
    
    GLKView *view = (GLKView *)self.view;
    view.context = self.context;
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    
    self.gameController = [[BBGameController alloc] initWithGLKViewController:self];
    self.delegate = gameController;
}

- (EAGLContext *)getGLContext {
    return self.context;
}

- (void)viewDidUnload
{    
    [super viewDidUnload];
    
    [self tearDownGL];
    
    if ([EAGLContext currentContext] == self.context) {
        [EAGLContext setCurrentContext:nil];
    }
	self.context = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc. that aren't in use.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)tearDownGL
{
    [EAGLContext setCurrentContext:self.context];
    
    glDeleteBuffers(1, &vertexBuffer);
    glDeleteVertexArraysOES(1, &vertexArray);
    
    self.effect = nil;
    
}

#pragma mark - GLKView and GLKViewController delegate methods


- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    [self.gameController drawScene];
}
@end
