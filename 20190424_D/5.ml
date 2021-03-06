open String;;

type tree = L | N of int * tree * tree;;

let tree = N (1,(N (2,(N (3,L,L)),(N (4,L,L)))),(N (5,(N (6,L,L)),(N (7,L,L)))));;

let rec find_low tree k = 
	match tree with
 L -> L
|N (n,tree1,tree2) -> if n < k then (N (n,(find_low tree1 k),(find_low tree2 k))) else L;;

let rec find n x i = 
	if x + i = n then i else (find n (x+i) (i+2));;

let rec string s depth = 
	sub s 0 ((length s) / depth);;

let rec create n k = 
	if k = n-1 then "    |" else (create n (k+1)) ^ "   |";;

let rec parse a depth length = 
	match a with 
 L -> if depth = 0 then print_string "+---L\n" else (if depth = 1 then print_string ((make length ' ') ^ "+" ^ (make (length-1) '-') ^ "L\n") else  print_string ((create (depth-1) 0) ^ "   +---L\n"));
|N (n,t1,t2) -> if depth = 0 then print_string ("+" ^ (make (length-2) '-') ^ "(" ^ (string_of_int n) ^ ")\n") else 
	       (if depth = 1 then print_string ((make length ' ') ^ "+" ^ (make (length-2) '-') ^ "(" ^ (string_of_int n) ^ ")\n") else  
					print_string ((create (depth-1) 0) ^ "   +--(" ^ (string_of_int n) ^ ")\n"));
					print_string ((create (depth+1) 0) ^ "\n");
					(parse t1 (depth+1) length);
					print_string ((create (depth+1) 0) ^ "\n");
					(parse t2 (depth+1) length);;
let rec create_tree n = 
	if n < 0 then L else (N (n,(create_tree (n-1)),L));;


parse (find_low tree 5) 0 4;;