class emmodle
{
 late String weib;
 late String email;
 late String te;
 late String fac;
 late String wat;
 late String ins;
 late String you;
 late String p;

 emmodle.formjson(Map<String,dynamic>json)
 {
   weib=json['weib'];
   email=json['email'];
   te=json['te'];
   fac=json['fac'];
   wat=json['wat'];
   ins=json['ins'];
   you=json['you'];
   p=json['p'];
 }
}