The object of this project is to develop methods querying gene network in relational database system

Gene ontology(GO) is set of controlled vocabulary to depict the roles of genes and gene products in life system. 
Gene ontology forms a complicated network and it can be modeled as a rooted directed acyclic graph (DAG), 
in which the node is gene and the relationship is edge.  The biological questions usually asked  are: 
1) gene A and gene B are related(In the graph, is there a path from A to B)? 
2) for a given gene(node), how many genes are in the downstream(successors) and upstream(ancestors). 
To answer those questions, in this project,  I compared two approaches to store and query the network of gene ontology. 
1) store genes and their relationships(parent-child) into tables and traverse the network by using DFS(deep-first-search) algorithm. 
2) firstly computer all relationships (any two connected nodes and the distances) and store into tables, 
and then query them directly to get result.  
It is expected that for the second approach to query the graph is in almost constant time by looking up the table directly, however, 
it needs much more space to store the intermediate data. 


Methods implemented by using MySQL and C++.

Gene ontology data was downloaded from http://www.geneontology.org/ (May, 2013), which includes 39,822 gene ontology terms and 77,246  term to term relationship.

Reference
Trissl S and Leser U (2005). Querying ontologies in relational database systems. In 2nd Conference on Data Integration in the Life Sciences (DILS05). Springer
Leser U (2005) A query language for biological networks. Bioinformatics  21 Suppl 2:ii33-ii39 

