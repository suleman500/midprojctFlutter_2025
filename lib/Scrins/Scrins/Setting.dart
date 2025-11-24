import 'package:flutter/material.dart';


class Setting  extends StatefulWidget{
String ?name="j";
String ?passs="l";
Setting({   this.name, this.passs});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),

      body: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            child: ListView.builder(itemCount: 1,itemBuilder: (context, index) {
              return myCouont();
            },),
          ),
          Text(widget.passs!)
        ],
      ),

    );
    
  }
  Widget myCouont(){
    
    return ListTile(
      title: Text(widget.name!),
      subtitle: Text(widget.name!),
      leading: Icon(Icons.person),
      onTap: () {
        TextFormField(
          decoration: InputDecoration(helper:Text(" تغير الاسم") ),
          onChanged: (value) {
            widget.name=value;
          },
          
        );
        
      },
      
      
    );
    
    
  }
}