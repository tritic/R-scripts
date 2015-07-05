#include <iostream>
#include <string>
#include <map>
#include <vector>
#include <fstream>
#include <sstream>
#include <stack>
#include "visit_graph.h"
using namespace std;

void trans_clos::dfs(){
	map<string, int> visited;
	stack <string> st;  
	st.push(root);
	map<string, int > preorder;
	map<string, int> postorder;
	map<string, int> distance2root;
	preorder[root] = 0;
	distance2root[root]= 0; 
	int count = 0;
	while(!st.empty()){
		if(edges.count(st.top())>0 ){
			cout <<"st.Top  "<<st.top()<< endl;
			vector <string> gnodes = edges[st.top()];
			if(gnodes.size()>0){  //node is not empty
				if(visited[st.top()]==0){
					visited[st.top()]=1;
					int dis_parent = distance2root[st.top()];
					for(int i=0; i<gnodes.size(); i++)
						distance2root[gnodes[i]]=dis_parent +1;
				}
				string curr_st=st.top();
				st.push(gnodes[0]);
				count++;
				preorder[gnodes[0]]=count;
				cout << gnodes[0] << endl;
				gnodes.erase(gnodes.begin()); //deleted visited edges(node);
				edges[curr_st] = gnodes;
			}
			else {
				cout <<"below visited  "<< st.top()<< endl;
				map<string, vector<string> >::iterator  it = edges.find(st.top());
				edges.erase(it);
				count++;
				postorder[st.top()] = count;
				st.pop();
			}
		}
		else {
			count++;
			postorder[st.top()] = count;
			st.pop();

		}

	}
	for(int i=0; i<nodes.size(); i++){
		string node = nodes[i];
		cout <<node << "  "<< preorder[node] << " " << postorder[node] << " " << distance2root[node] << "  " << endl;
	} 

}


void trans_clos::readfile(ifstream &infile){
	int i=0;
	map<string, int> countnodes; // give each node a digit number
	while(!infile.eof()){

		i++;
		if(i==1) {
			infile >> root;

			cout << "root  " << root << endl;
			continue;
		}
		string nod1="";
		string nod2="";
		infile >> nod1 >> nod2;
		if(!nod1.empty()){
			edges[nod1].push_back(nod2);
			cout << nod1 << "|" << nod2 << endl;         
			countnodes[nod1]++;
			countnodes[nod2]++;
			if(countnodes[nod1] ==1){
				nodes.push_back(nod1);
			} 
			if(countnodes[nod2] ==1){
				nodes.push_back(nod2);
			}

		}
	}     
	//give each node a digital numbers
	for(int i=0; i< nodes.size(); i++){
		nodes_digt[nodes[i]] = i;
		digt_node[i] = nodes[i];
	}
	convert_adlist2matrix();
}

void trans_clos::cal_transclos(){
     int n = nodes.size();
     for(int k=0; k<n; k++){
         for(int i=0; i<n; i++){
                for(int j =0; j<n; j++){
                    if(matrixr[i][k]>0 && matrixr[k][j]>0){
                          if(matrixr[i][j]<1) {
                                  matrixr[i][j] = matrixr[i][k]+matrixr[k][j];
                           }
                           else { if(matrixr[i][j] > matrixr[i][k]+matrixr[k][j])
                      
                                   matrixr[i][j]= matrixr[i][k]+matrixr[k][j];
                                  
                           }
                   }
             }
        }
   }
}


void trans_clos::convert_adlist2matrix(){
	map<string, vector<string> >::iterator it;
	for(it= edges.begin(); it!=edges.end(); it++){
		string head =it->first;
		vector <string> tails = it->second;
		for(int i =0; i<tails.size(); i++){
			string tail = tails[i];
			matrixr[nodes_digt[head]][nodes_digt[tail]] =1;
		}
	}   

}

void trans_clos::display_trans_clos(){
	for(int i =0; i< nodes.size(); i++){
		for(int j=0; j< nodes.size(); j++){
			if(matrixr[i][j]>0){
				cout <<digt_node[i] << "  " << digt_node[j] << " " << matrixr[i][j] << endl;
			}
		}
	}


}

