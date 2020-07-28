log+=chr($D)
if (argument_count > 0) {
new_out = argument[0]
for (i = 0; i < argument_count; i += 1) {
    //arg = argument[i]
    //if (is_real(arg))
        //arg = string(argument[i])
    //new_out = string_replace(new_out,"%d",arg)
    new_out = string_replace(new_out,"\f",string(argument[i]))
}
log+=new_out }

