/*
 * Author: Alexander Lozada
 * Date: 3/6/2017
 * Purpose: An implementation of Kosaraju's two-pass algorithm for determining Strongly Connected Components
 */

package algorithm;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Scanner;
import java.util.Stack;

public class KosarajuAlgorithm {
	
	private File file;
	private Scanner input;
	private Scanner line;
	private Map<Integer, Vertex> graph = new HashMap<Integer, Vertex>(); //I chose to represent the graph as a HashMap
	private Map<Integer, Vertex> graph_r = new HashMap<Integer, Vertex>(); //Reversed graph
	private Stack<Integer> stack = new Stack<Integer>();
	private ArrayList<ArrayList<Vertex>> results = new ArrayList<ArrayList<Vertex>>();
	private ArrayList<Vertex> list;
	private ArrayList<Integer> countList = new ArrayList<Integer>();
	private Iterator<Entry<Integer, Vertex>> graphIt;

	
	 //-----------------------------------------
	 // Open scanner, fill graphs, and start DFS
	 //-----------------------------------------
	public KosarajuAlgorithm(String path) {
		
		file = new File("src/" + path);
		
		try {
			input = new Scanner(file);
		} catch (Exception FileNotFoundException) {
			System.out.println("Err:File not found");
			System.exit(0);
		}
		
		fillGraph();
		
		try {
			input = new Scanner(file); //reset the scanner
		} catch (FileNotFoundException e) {
			System.out.println("Err:File not found");
			System.exit(0);
		} 
		
		fillGraph_r();
		
		// -------------------------------------------------------------------------------
		// Performs DFS over every value in the graph, if it hasn't been done already
		// -------------------------------------------------------------------------------
		
		for (int key : graph.keySet()) {
			if (!(graph.get(key).isVisited())) {
				DFS(graph.get(key).getData());
			}
		}
		
		// -------------------------------------------------------------------------------
		// Performs second pass of DFS on the reverse graph and adds the results to a list
		// -------------------------------------------------------------------------------
		
		while (!stack.isEmpty()) {
			Vertex temp = graph_r.get(stack.pop());
			if (!temp.isVisited()) {
				graph_r.get(temp.getData()).visit();		
				
				list = new ArrayList<Vertex>();
				results.add(DFS_r(temp.getData(),list));				
			}
		}
		
		//Count strongly connected component sizes
		for (int i=0; i<results.size(); i++) {
			int count = 0;
			for (int j=0; j<results.get(i).size(); j++) {
				//uncomment if you want to see what's in the scc's
				//System.out.print(results.get(i).get(j).toString() + " ");
				count++;
			}
			countList.add(count);
		}
		
		//Sort countList in descending order and print the top 10 results
		Collections.sort(countList);
		Collections.reverse(countList);
		
		for (int i=0;i<10;i++) {
			if (countList.get(i) == null) {
				break;
			} else if (i==9) {
				System.out.print(countList.get(i));
			} else {
				System.out.print(countList.get(i) + ",");
			}

		}
		input.close();
		line.close();
	}
	
	@SuppressWarnings("resource")
	private void fillGraph() {
		while (input.hasNext()) {
			line = new Scanner(input.nextLine()).useDelimiter("\\s+");
			int firstInt = Integer.parseInt(line.next());
			int secondInt = Integer.parseInt(line.next());
			
			//----------------------------------------------------------------------------
			// If statements check to see if a vertex already exists for first and second 
			// int, if not then a vertex object is created for the respective value 
			// and is then inserted into the graph.
			// ---------------------------------------------------------------------------
			
			if (graph.get(firstInt) == null) {
				Vertex vertex = new Vertex(firstInt);
				graph.put(firstInt, vertex);
			}
			
			if (graph.get(secondInt) == null) {
				Vertex sink = new Vertex(secondInt);
				graph.put(secondInt, sink);
				graph.get(firstInt).addNeighbor(sink);
			} else {
				graph.get(firstInt).addNeighbor(graph.get(secondInt));
			}
		}
	}
	
	// -------------------------------------------------------
	// Same process as fillGraph(), but the ints are reversed
	// -------------------------------------------------------
	
	@SuppressWarnings("resource")
	private void fillGraph_r() {
		while (input.hasNext()) {
			line = new Scanner(input.nextLine()).useDelimiter("\\s+");
			int secondInt = line.nextInt();
			int firstInt = line.nextInt();
			
			if (graph_r.get(firstInt) == null) {
				Vertex vertex = new Vertex(firstInt);
				graph_r.put(firstInt, vertex);
			}	
				
			if (graph_r.get(secondInt) == null) {
				Vertex sink = new Vertex(secondInt);
				graph_r.put(secondInt, sink);
				graph_r.get(firstInt).addNeighbor(sink);
			} else {
				graph_r.get(firstInt).addNeighbor(graph_r.get(secondInt));
			}		
		}
	}
	
	// -----------------------------------------------------
	// If the vertex has not been visited, it is 
	// marked as visited and each child vertex is visited
	// After recursively visiting child vertices the parent 
	// key is pushed onto the stack 
	// -----------------------------------------------------
	
	private void DFS(int key) {
		if (!(graph.get(key).isVisited())) {
			graph.get(key).visit();
			
			for (int i = 0; i < graph.get(key).getNeighbors().size(); i++) {
				if (!(graph.get(key).getNeighbors().get(i).isVisited())) {
					DFS(graph.get(key).getNeighbors().get(i).getData());
				}
			}			
			stack.push(key);
		}
	}
	
	// ------------------------------------------------------------------------------------
	// While the stack is not empty, if the element at the top of the stack is not visited, 
	// it pops it off of the stack, gets the corresponding vertex, marks it as visited, and 
	// adds it to the SCC, then recursively calls DFS_r on its neighbors
	// ------------------------------------------------------------------------------------
	
	private ArrayList<Vertex> DFS_r(int key, ArrayList<Vertex> scc) {
		graph_r.get(key).visit();
		scc.add(graph_r.get(key));
		for (int i = 0; i < graph_r.get(key).getNeighbors().size(); i++) {
			if (!(graph_r.get(key).getNeighbors().get(i).isVisited())) {
				DFS_r(graph_r.get(key).getNeighbors().get(i).getData(), scc);
			}
		}
		return scc;
	}
}
