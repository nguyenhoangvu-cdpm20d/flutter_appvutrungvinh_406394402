import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/widgets.dart';

class Person extends StatefulWidget{
  @override
  
    // TODO: implement createState
    State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: Center(child:Column(
        mainAxisSize: MainAxisSize.max,
       mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top:45),
            child: Text('ThÔNG TIN CÁ NHÂN ',style: TextStyle(
              fontSize: 40,
              color: Colors.redAccent.shade700,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.red.shade300.withOpacity(0.3),
                  offset: Offset(15,15),
                  blurRadius: 15
                )
              ]
            ),),),

          Container(
            padding: EdgeInsets.only(bottom: 5,top: 30),
            child: CircleAvatar(
              radius: 65.0,
              backgroundImage: AssetImage('images/123.jpg'), 
              
            ),
          
          ),
         Container(
            padding: EdgeInsets.only(top: 0),
            child: Text('LE CHI TRUNG',
            style: TextStyle(
              color: Colors.redAccent.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),),
          ),
          Container(
            padding: EdgeInsets.only(top: 50),
            child: Text('GT:Nam',style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.pink.shade600
            ),),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text('SDT:0971971***',style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.pink.shade600
            ),),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text('NS:03/07',style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.pink.shade600
            ),),
          ),
        Container(
            padding: EdgeInsets.all(15),
            child: Text('Tổng Điểm:4200',style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.pink.shade600
            ),),
          )
        ],
        
      ),
      
      ),

       
      
     );
  }
}