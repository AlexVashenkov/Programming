open String;;

type tree = L | N of int * tree * tree;;

let l = [16;11;9;10;5;6;8;1;2;4];;

let rec get_elem l n = 
	match l with
 [] -> failwith""
|a :: b -> if n = 0 then a else (get_elem b (n-1));;

let rec make_tree l n = 
	if n = (List.length l) then L else
	if 2*n+1 >= (List.length l) then (N ((get_elem l n),L,L)) else
	if 2*n+2 >= (List.length l) then (N ((get_elem l n),(N ((get_elem l (2*n+1)),L,L)),L)) else
	(N ((get_elem l n),(make_tree l (2*n+1)),(make_tree l (2*n+2))));;

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

parse (make_tree l 0) 0 4;;		