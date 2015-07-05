/* Reachability:   gene A and gene B are in the same genetic pathway ? */

(SELECT 1
FROM prePostOrder as p1,
prePostOrder as p2
WHERE p1.gene = 'A'
AND p2.gene = 'B'
AND p1.pre > p2.pre
AND p1.post <= p2.post)
union 
(SELECT 1
FROM prePostOrder as p1,
prePostOrder as p2
WHERE p1.gene = 'A'
AND p2.gene = 'B'
AND p1.pre < p2.pre
AND p1.post > p2.post);
