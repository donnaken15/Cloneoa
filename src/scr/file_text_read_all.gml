  if file_exists(argument0)
  {
    var f,s;
    f = file_text_open_read(argument0)
    s = ""
    while (!file_text_eof(f))
    {
      s += file_text_read_string(f)
      s += chr($D)
      file_text_readln(f)
    }
    file_text_close(f)
    return s
  }
  else
    show_error("File does not exist: "+argument0,false)
