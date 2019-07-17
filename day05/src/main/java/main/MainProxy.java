package main;

import chap06.ExeTimeCalculator;
import chap06.ImplCalculator;

public class MainProxy {
	public static void main(String[] args) {
		ExeTimeCalculator ttCal1 = new ExeTimeCalculator(new ImplCalculator());
		System.out.println(ttCal1.factorial(20));
		ExeTimeCalculator ttCal2 = new ExeTimeCalculator(new ImplCalculator());
		System.out.println(ttCal2.factorial(20));
	
	}

}
