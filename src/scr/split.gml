
/// string_split(:string, delimiter:string, list<string>):list<string>
/// base of code by yellowafterlife / yal.cc
/// FIGURE THIS OUT
var i, s, d, arr, p, dl;
i = 0;
s = argument0;
d = argument1;
arr = 0;
p = string_pos(d, s);
dl = string_length(d);
if (dl) while (p) {
	p -= 1;
	arr[i] = string_copy(s, 1, p);
	s = string_delete(s, 1, p + dl);
	p = string_pos(d, s);
	i += 1;
}
arr[i]=s;
return r;
