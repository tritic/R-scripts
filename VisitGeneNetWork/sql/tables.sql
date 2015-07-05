create table if not exists prePostOrder (
		gene varchar(10) primary key,
		pre  int,
		post int,
		level int
		);
CREATE TABLE if not exists term (
			gene VARCHAR(10) NOT NULL,
			geneOntology VARCHAR(100),
			UNIQUE KEY gene (gene)
			);
CREATE TABLE if not exists term2term (
			parent VARCHAR(10) NOT NULL,
			child VARCHAR(10) NOT NULL,
			PRIMARY KEY (parent, child)   
			);

