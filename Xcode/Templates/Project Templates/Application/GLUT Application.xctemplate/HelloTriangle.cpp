//
//  ___PROJECTNAME___.cpp
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#include <stdio.h>
#include "glew.h"
#include <GLUT/GLUT.h>

#include "ShaderHelpers.h"

GLfloat vertices[] = {
    0.0f,   0.5f,
    0.5f, -0.25f,
    -0.5f, -0.25f,
};
const int COORDS_PER_VERTEX = 2;
const int numVertices = sizeof(vertices) / (sizeof(GLfloat) * COORDS_PER_VERTEX);

GLuint vertexBufferName;

const int VERTEX_ATTRIBUTE = 0;

GLuint shaderProgram;

// Initializes OpenGL state
void setupGL()
{
	// Set a blue background
	glClearColor(0.0f, 0.0f, 1.0f, 1.0f);
    
    shaderProgram = createProgramFromFiles("Shader");
    
    // Create the buffer objects
    glGenBuffers(1, &vertexBufferName);
    
    // Copy data to video memory
    // Vertex data
    glBindBuffer(GL_ARRAY_BUFFER, vertexBufferName);
	glEnableVertexAttribArray(VERTEX_ATTRIBUTE);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
	glVertexAttribPointer(VERTEX_ATTRIBUTE, COORDS_PER_VERTEX, GL_FLOAT, GL_FALSE, 0, 0);    
}

// Draws everything
void render()
{
    // Clear the screen
	glClear(GL_COLOR_BUFFER_BIT);
    
    // Prepare shader
    glUseProgram(shaderProgram);
    
    // Draw things   
    glBindBuffer(GL_ARRAY_BUFFER, vertexBufferName);
    glDrawArrays(GL_TRIANGLES, 0, numVertices);
    
    // Display the back buffer
	glutSwapBuffers();
}

int main(int argc, char *argv[])
{
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGBA);
	glutInitWindowSize(600, 600);
	glutCreateWindow("___PROJECTNAME___");
    glutDisplayFunc(render);

    GLenum err = glewInit();
	if (GLEW_OK != err) {
		fprintf(stderr, "GLEW error:  %s\n", glewGetErrorString(err));
		return 1;
	}
    printf("OpenGL version: %s\n", glGetString(GL_VERSION));
    printf("GLSL version: %s\n", glGetString(GL_SHADING_LANGUAGE_VERSION));
    printf("Renderer: %s\n", glGetString(GL_RENDERER));
    
    setupGL();
    
    glutMainLoop();
    return 0;
}
