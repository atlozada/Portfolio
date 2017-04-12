/*
 * Author: Alexander Lozada
 * Date: 3/6/2017
 * Purpose: Main method for KosarajuAlgorithm class
 */

package algorithm;

public class Main {

	public static void main(String[] args) {
		if (args.length > 0) {
			KosarajuAlgorithm alg = new KosarajuAlgorithm(args[0]);
		} else {
			System.out.println("Please include a file path in the command line arguments.");
			System.exit(0);
		}
	}
	
}
