/*
 * Author: Alexander Lozada
 * Date: 3/6/2017
 * Purpose: Vertex class used in the KosarajuAlgorithm
 */

package algorithm;

import java.util.ArrayList;

public class Vertex {
	
	private int data;
	private boolean isVisited = false;
	private ArrayList<Vertex> neighbors = new ArrayList<Vertex>();

	protected Vertex(int data) {
		this.data = data;
	}
	
	protected void addNeighbor(Vertex sink) {
		neighbors.add(sink);
	}
	
	protected void visit() {
		isVisited = true;
	}
	
	protected ArrayList<Vertex> getNeighbors() {
		return neighbors;
	}
	
	protected int getData() {
		return data;
	}
	
	protected boolean isVisited() {
		return isVisited;
	}
	
	public String toString() {
		return data + "";
	}
}
