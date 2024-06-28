class catageroymodle
{

  late String name;
  late String? doc;

  catageroymodle({required this.name,this.doc});

  catageroymodle.formjson(Map<String,dynamic>json)
  {
    name=json['name'];
    doc=json['doc'];

  }
  Map<String,dynamic>tomap()
  {
    return
      {
        "name":name,
        "doc":doc,
      };
  }
}