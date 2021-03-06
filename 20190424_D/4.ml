open String;;

type tree = L | N of int * tree * tree;;

let n = 9;;

let daddy = n * n;;

let rec find n x i = 
	if x + i = n then i else (find n (x+i) (i+2));;

let rec string s depth = 
	sub s 0 ((length s) / depth);;

let rec create n k = 
	if k = n-1 then "    |" else (create n (k+1)) ^ "   |";;

let rec parse a depth length = 
	match a with 
 L -> if depth = 0 then print_string "+---L\n" else (if depth = 1 then print_string ((make length ' ') ^ "+" ^ (make (length-1) '-') ^ "L\n") else  print_string ((create (depth-1) 0) ^ "   +---L\n"));
|N (n,t1,t2) -> if depth = 0 then print_string ("+" ^ (make (length-2) '-') ^ "()\n") else 
	       (if depth = 1 then print_string ((make length ' ') ^ "+" ^ (make (length-2) '-') ^ "()\n") else  
					print_string ((create (depth-1) 0) ^ "   +--()\n"));
					print_string ((create (depth+1) 0) ^ "\n");
					(parse t1 (depth+1) length);
					print_string ((create (depth+1) 0) ^ "\n");
					(parse t2 (depth+1) length);;
let rec create_tree n r = 
	if n = 0 then L else
	if r = 0 then (if (Random.int 1) = 1 then (N ((Random.int 100),L,(create_tree (n-1) (Random.int 1)))) else (N ((Random.int 100),(create_tree (n-1) (Random.int 1)),L))) else
	(N ((Random.int 100),(create_tree (n-1) (Random.int 1)),(create_tree (n-1) (Random.int 1))));;

parse (create_tree 2 (Random.int 1)) 0 4;;	