package helloworld;

import helloworld.print.ConsoleHelloWorldPrinter;
import helloworld.print.IHelloWorldPrinter;

public class HelloWorld {

    public static void main(String[] args) {

        IHelloWorldPrinter printer = new ConsoleHelloWorldPrinter();
        printer.print("Hello World!");
    }
}
