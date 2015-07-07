#ifndef TRANS_CLOSE_H
#define TRANS_CLOSE_H

#include <iostream>
#include <string>
#include <map>
#include <vector>
#include <fstream>
#include <sstream>

using namespace std;
class trans_clos {

  private:
      int  matrixr[100000][100000];
      vector<string> nodes;
      map<string, int> nodes_digt; // give each node a digit number
      map<int, string> digt_node; //the digit number corrosponding to the node 
      map<string, vector<string> > edges; //record all edges
      void convert_adlist2matrix();
      string root;
      
  public:
      trans_clos(){cout << "default construct\n";}
      trans_clos(int);
      void cal_transclos();
      void  readfile(ifstream &);
      void display_trans_clos();
      void dfs();
};

#endif
