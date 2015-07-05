#include <iostream>
#include <string>
#include <map>
#include <vector>
#include <fstream>
#include <sstream>
#include "visit_graph.h"
using namespace std;

int main(int argc, char *argv[]){
	trans_clos graph1;
	ifstream file(argv[1]);
	graph1.readfile(file);
	graph1.cal_transclos();
	graph1.dfs();
}
