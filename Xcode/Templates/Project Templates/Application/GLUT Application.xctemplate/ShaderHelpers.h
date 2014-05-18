//
// ShaderHelpers.h
//

#import "ShaderHelpers.h"

#ifndef SHADERHELPERS_H
#define SHADERHELPERS_H

void checkGlError(const char* op);

GLuint loadShader(GLenum shaderType, const char* pSource);

GLuint createProgramFromFiles(const char *shaderName);

GLuint createProgram(const char* pVertexSource,
                     const char* pFragmentSource);

const char *pathForBundleResource(const char *filename);

#endif
