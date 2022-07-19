
import 'package:flutter/material.dart';
import 'package:sample_mvvm/model/user_list_model.dart';
import 'package:sample_mvvm/resources/components/app_title.dart';
 
class UserListRow extends StatelessWidget {
   final UserModel userModel;
   //final Function onTap;
   UserListRow({Key? key,required this.userModel,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //onTap: onTap(),
      child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     AppTitle(text:userModel.name!,)   
                ],),
            ),
    );
  }
}