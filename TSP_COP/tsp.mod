/*********************************************
 * OPL 22.1.0.0 Model
 * Author: User
 * Creation Date: Dec 7, 2023 at 3:49:54 PM
 *********************************************/
// Define the sets
int n = 4; // Number of cities
range Cities = 1..4;

// Define the decision variables
dvar boolean x[Cities][Cities]; // 1 if the path goes from i to j, 0 otherwise

// Define the objective function
minimize sum(i in Cities, j in Cities: i!=j) x[i][j]*distance[i][j];

// Define the constraints
subject to {
  // Constraints to ensure each city is visited exactly once
  forall(i in Cities)
    sum(j in Cities: i!=j) x[i][j] == 1;
  
  forall(j in Cities)
    sum(i in Cities: i!=j) x[i][j] == 1;
}
 
