/*All Ancestor of gene J */

SELECT p2.gene
FROM prePostOrder as p1,
prePostOrder as p2
WHERE p1.gene = 'J'
AND p1.pre > p2.pre
AND p1.post <= p2.post;
