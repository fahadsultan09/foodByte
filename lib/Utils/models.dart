import 'package:flutter/foundation.dart';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class Food {
  final int id;
  final int restId;
  final String fname;
  final int fid;
  final int servings;
  final double price;

  Food({this.id,this.restId,this.fname,this.fid,this.servings,this.price});

factory Food.fromJson(Map<String,dynamic>json)
{
 return Food(

 );
}

  
}

class Order{
  final int id;
  final int fid;
  final int quantity;
  final String emailId;
  final int ordernumber;

  Order({this.id,this.fid,this.quantity,this.emailId,this.ordernumber});

  factory Order.fromJson(Map<String,dynamic>json)
  {
    return Order();
  }

}

class Rest{
  final int id;
  final String restaurant_name;
  final String phone;
  final String starttime;
  final String endtime;

  Rest({this.id,this.restaurant_name,this.phone,this.starttime,this.endtime});

  factory Rest.fromJson(Map<String,dynamic>json){
    return Rest();
  }
}

class User{
  final String emailId;
  final String username;
  final String password;
  final int number;
  final String address;
  final double wallet;
  final String city;
  User({this.emailId,this.username,this.password,this.number,this.address,this.wallet,this.city});

  factory User.fromJson(Map<String,dynamic>json)
  {
    return User();
  }
  
}

