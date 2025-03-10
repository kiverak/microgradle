# microgradle


# First iteration
**Compiling:**\
javac -d out -cp lib/JColor-bundle-5.5.1.jar src/helloworld/helloworld.HelloWorld.java src/helloworld/print/ConsoleHelloWorldPrinter.java src/helloworld/print/IHelloWorldPrinter.java

**Running:**\
java -cp "out:lib/JColor-bundle-5.5.1.jar" helloworld.HelloWorld


# Second iteration
### Create the build directory
mkdir build

### Find all .java files recursively and save their paths to build/sources.txt
find . -name "*.java" > build/sources.txt

### Compile the .java files listed in sources.txt, specifying the output directory and classpath
javac -d out/classes -cp "lib/*:src" @build/sources.txt

### Change to the classes output directory
cd out/classes

### Create the HelloWorld.jar file with manifest
jar cfm ../HelloWorld.jar ../../manifest.txt .

### Change to the main directory
cd ../..

## Run
java -cp "lib/*:out/HelloWorld.jar" helloworld.HelloWorld



# Third iteration
### Create microgradle.sh

### Change permission
chmod +x microgradle.sh

### Use commands
microgradle.sh build \
microgradle.sh run



*SOURCE:* https://habr.com/ru/articles/752014