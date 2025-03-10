#!/bin/bash

if [ "$1" == "build" ]; then
  # Create build directory
  mkdir -p build

  # Find all Java files and save them in sources.txt
  find . -name "*.java" > build/sources.txt

  # Compile all Java files, specify the output directory and classpath
  javac -d out/classes -cp "lib/*:src" @build/sources.txt

  # Navigate to the output directory
  cd out/classes

  # Create the JAR file, including the manifest
  jar cfm ../HelloWorld.jar ../../manifest.txt .

  echo "Build complete."

elif [ "$1" == "run" ]; then
  echo "Running..."
  # Run the HelloWorld main class
  java -cp "lib/*:out/HelloWorld.jar" helloworld.HelloWorld

elif [ "$1" == "dependencies" ]; then
  echo "Resolving dependencies..."
  # Create the 'lib' directory if it doesn't exist
  mkdir -p lib

  # Run the Ivy JAR file to retrieve dependencies
  java -jar ./ivy-2.5.3.jar -retrieve "lib/[artifact]-[type]-[revision].[ext]"

else
    echo "Unknown command: $1"
fi
