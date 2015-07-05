/*All desesandant of gene A */

SELECT p2.gene
FROM prePostOrder as p1,
prePostOrder as p2
WHERE p1.gene = 'C'
AND p1.pre < p2.pre
AND p1.post >= p2.post;

