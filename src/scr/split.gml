
/// string_split(:string, delimiter:string, list<string>):list<string>
/// by yellowafterlife / yal.cc
/// FIGURE THIS OUT
var s, d, r, p, dl;
s = argument0;
d = argument1;
r = argument2;
if (r < 0) r = ds_list_create(); else ds_list_clear(r);
p = string_pos(d, s);
dl = string_length(d);
if (dl) while (p) {
	p -= 1;
	ds_list_add(r, string_copy(s, 1, p));
	s = string_delete(s, 1, p + dl);
	p = string_pos(d, s);
}
ds_list_add(r, s);
return r;
