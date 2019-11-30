import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Restaurant extends StatefulWidget {

  Map restaurant;

  Restaurant(this.restaurant);
  @override
  _RestaurantState createState() => _RestaurantState(this.restaurant);
}

class _RestaurantState extends State<Restaurant> {
  Map restaurant;
   var isSelected = false;
  Color mycolor=Colors.white;
  
  _RestaurantState(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(

            expandedHeight: 200.0,
            floating: false,
            pinned: true, 
            flexibleSpace: FlexibleSpaceBar(
              
              centerTitle: true,
              title: Text(restaurant["title"],style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic ),),
              background: Image.asset(restaurant["img"],fit:BoxFit.cover,),
              
            ),
          ),
          SliverFillRemaining(
            
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {

                return cardy();
                  // return Card(
                  //   borderOnForeground: true,
                  //    color: mycolor,
                  //    child: ListTile(
                  //      title: Text("Chicken Biryani",style: TextStyle(fontSize: 30),),
                  //      subtitle: Text("Rs 100",style: TextStyle(fontSize: 20.0),),
                  //      leading: CircleAvatar(
                  //        radius: 30.0,
                  //        backgroundImage: AssetImage('assets/food12.jpg'),
                  //      ),
                  //      isThreeLine: true,
                  //     onLongPress: (){
                        
                  //       // if(mycolor == Colors.white){
                  //       //     setState(() {
                  //       //       mycolor = Colors.grey;
                  //       //     });
                  //       // }
                  //       // else{
                  //       //   mycolor = Colors.white;
                  //       // }
                        
                        
                  //     },
                  //    ),
                  // );
              },
            ),
            )
        ],
      ),
    ); 
  }
  
}


class cardy extends StatefulWidget {
  @override
  _cardyState createState() => new _cardyState();
}

class _cardyState extends State<cardy> {
  var isSelected = false;
  var mycolor=Colors.white;
  Color _color = Colors.red;
  int i = 0;
  @override
  Widget build(BuildContext context) {
    
    return new Card(
      color: Colors.white,
      child: new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        new ListTile(
            selected: isSelected,
            leading: CircleAvatar(
                         radius: 30.0,
                         backgroundImage: AssetImage('assets/food12.jpg'),
                       ),
                       title: Text("Chicken Biryani",style: TextStyle(fontSize: 25,color: Colors.black,),),
                       subtitle: Text("Rs 100",style: TextStyle(fontSize: 20.0,color: Colors.black),),
            trailing: ClipOval(
          child: Container(
            color: _color,
            height: 30.0, // height of the button
            width: 30.0, // width of the button
            child: Center(child: Text(i.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
          ),
        ),
      
            onTap: (){
              
                setState(() {
                  //  mycolor=Colors.white;
                 if(i!=0){
                    i--;
                 }
                 if(i==0){
                   _color = Colors.red;
                 }
                 

                });
              
            },
            onLongPress: (){
               setState(() {
      if (isSelected) {
        // mycolor=Colors.white;
        isSelected = false;
      } else {
        // mycolor=Colors.grey[300];
        // isSelected = true;
        _color = Colors.green;
        i++;
      }
    });
            } // what should I put here,
            )
      ]),
    );
  }

  void toggleSelection() {
    setState(() {
      if (isSelected) {
        mycolor=Colors.white;
        isSelected = false;
      } else {
        mycolor=Colors.grey[300];
        isSelected = true;
      }
    });
  }
}