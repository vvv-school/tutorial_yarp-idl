#memory.thrift
service Memory {
  string get_answer(1: string k);
  bool push(1:string k, 2:string v);
  bool show_list();
  bool clear();
}
