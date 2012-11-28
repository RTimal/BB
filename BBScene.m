//
//  BBScene.m
//  BB
//
//  Created by Rajiev Timal on 11/27/12.
//  Copyright (c) 2012 Bleep. All rights reserved.
//

#import "BBScene.h"
#import "monkey.h"
#import "BBViewController.h"

@interface BBScene ()
{
    GLKMatrix4 modelViewProjectionMatrix;
    GLKMatrix3 normalMatrix;
    float rotation;
    
    GLuint vertexArray;
    GLuint vertexBuffer;
}

@property (nonatomic, retain) BBViewController *glkViewController;
@property (strong, nonatomic) GLKReflectionMapEffect *effect;
@property (strong, nonatomic) GLKTextureInfo *cubemap;
@property (strong, nonatomic) GLKSkyboxEffect *skyboxEffect;

- (void)setupGL;
- (void)tearDownGL;
@end

@implementation BBScene

-(id)initWithGLKViewController:(BBViewController *)glkVC {
    
    if (self = [super init]) {
        self.glkViewController = glkVC;
        [self setupGL];
    }
    return self;
}

-(void)setupGL {
    [EAGLContext setCurrentContext:[self.glkViewController getGLContext]];
    
    self.effect = [[GLKReflectionMapEffect alloc] init];
    self.effect.light0.enabled = GL_TRUE;
    self.effect.lightingType = GLKLightingTypePerPixel;
    
    self.skyboxEffect = [[GLKSkyboxEffect alloc] init];
    
    // Turn on the first light
    self.effect.light0.enabled = GL_TRUE;
    self.effect.light0.diffuseColor = GLKVector4Make(1.0f, 1.f, 1.f, 1.0f);
    self.effect.light0.position = GLKVector4Make(-1.f, -1.f, 2.f, 1.0f);
    self.effect.light0.specularColor = GLKVector4Make(1.0f, 1.0f, 1.0f, 1.0f);
    self.effect.light0.ambientColor = GLKVector4Make(.2, .2, .2, 1.0);
    
    // Turn on the second light
    self.effect.light1.enabled = GL_TRUE;
    self.effect.light1.diffuseColor = GLKVector4Make(.4f, 0.4f, 0.4f, 1.0f);
    self.effect.light1.position = GLKVector4Make(15.f, 15.f, 15.f, 1.0f);
    self.effect.light1.specularColor = GLKVector4Make(1.0f, 0.0f, 0.0f, 1.0f);
    
    // Set material
    self.effect.material.diffuseColor = GLKVector4Make(1.f, 1.f, 1.0f, 1.0f);
    self.effect.material.ambientColor = GLKVector4Make(1.f, 1.f, 1.f, 1.0f);
    self.effect.material.specularColor = GLKVector4Make(1.0f, 0.0f, 0.0f, 1.0f);
    self.effect.material.shininess = 320.0f;
    self.effect.material.emissiveColor = GLKVector4Make(0.4f, 0.4, 0.4f, 1.0f);
    
    glEnable(GL_DEPTH_TEST);
    
    glGenVertexArraysOES(1, &vertexArray);
    glBindVertexArrayOES(vertexArray);
    
    glGenBuffers(1, &vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(MeshVertexData), MeshVertexData, GL_STATIC_DRAW);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(GLfloat), 0);
    glEnableVertexAttribArray(GLKVertexAttribNormal);
    glVertexAttribPointer(GLKVertexAttribNormal, 3, GL_FLOAT, GL_FALSE,  6 * sizeof(GLfloat), (char *)12);
    
    
    NSArray *cubeMapFileNames = [NSArray arrayWithObjects:
                                 [[NSBundle mainBundle] pathForResource:@"cubemap1" ofType:@"png"],
                                 [[NSBundle mainBundle] pathForResource:@"cubemap2" ofType:@"png"],
                                 [[NSBundle mainBundle] pathForResource:@"cubemap3" ofType:@"png"],
                                 [[NSBundle mainBundle] pathForResource:@"cubemap4" ofType:@"png"],
                                 [[NSBundle mainBundle] pathForResource:@"cubemap5" ofType:@"png"],
                                 [[NSBundle mainBundle] pathForResource:@"cubemap6" ofType:@"png"],
                                 nil];
    NSError *error;
    NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES]
                                                        forKey:GLKTextureLoaderOriginBottomLeft];
    self.cubemap = [GLKTextureLoader cubeMapWithContentsOfFiles:cubeMapFileNames
                                                        options:options
                                                          error:&error];
    
    self.effect.textureCubeMap.name = self.cubemap.name;
    self.skyboxEffect.textureCubeMap.name = self.cubemap.name;
    
    glBindVertexArrayOES(0);    
}

-(void)update {
    float aspect = fabsf(self.glkViewController.view.bounds.size.width / self.glkViewController.view.bounds.size.height);
    GLKMatrix4 projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(65.0f), aspect, 0.1f, 100.0f);
    
    self.effect.transform.projectionMatrix = projectionMatrix;
    self.skyboxEffect.transform.projectionMatrix = projectionMatrix;
    
    GLKMatrix4 modelViewMatrix = GLKMatrix4MakeTranslation(0.0f, 0.0f, -3.5f);
    modelViewMatrix = GLKMatrix4Rotate(modelViewMatrix, rotation, 1.0f, 1.0f, 1.0f);
    
    self.effect.transform.modelviewMatrix = modelViewMatrix;
    
    modelViewMatrix = GLKMatrix4Scale(modelViewMatrix, 50, 50, 50);
    self.skyboxEffect.transform.modelviewMatrix = modelViewMatrix;
    
    rotation += self.glkViewController.timeSinceLastUpdate * 0.5f;
}

- (void)draw {
    glClearColor(0.65f, 0.65f, 0.65f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    [self.skyboxEffect prepareToDraw];
    [self.skyboxEffect draw];
    
    // Render the object with GLKit
    glBindVertexArrayOES(vertexArray);
    [self.effect prepareToDraw];
    
    glDrawArrays(GL_TRIANGLES, 0, sizeof(MeshVertexData) / sizeof(vertexData));
    glDrawArrays(GL_TRIANGLES, 0, sizeof(MeshVertexData) / sizeof(vertexData));
}


- (void)addObjectToScene:(id)object {
    
    
}



@end
