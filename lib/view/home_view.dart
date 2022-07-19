import 'dart:html';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_mvvm/model/user_list_model.dart';
import 'package:sample_mvvm/resources/components/app_loading.dart';
import 'package:sample_mvvm/resources/components/user_list_row.dart';
import 'package:sample_mvvm/view_model/user_view_model.dart';

class HomeView extends StatelessWidget {
   HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // UserViewModel userViewModel = context.watch<UserViewModel>();
   final userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
        appBar: AppBar(title: Text('Sample api'),
          actions: [IconButton(onPressed: () {
            //openAddUser(context);
          }, icon: Icon(Icons.add))],
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              bodyWidget(userViewModel),
            ],
          ),
        ));
  }

  Widget bodyWidget(UserViewModel userViewModel) {
     if (userViewModel.loading) {
      return Apploading();
    }
  /*  if (userViewModel.userError.message != null) {
      return AppError(errorText:userViewModel.userError.message.toString(),);
    } */
    return Expanded(
        child: ListView.builder(
            itemCount: userViewModel.userListModel.length,
            itemBuilder: (context, index) {
              UserModel userModel = userViewModel.userListModel[index];
              return UserListRow(
                userModel: userModel,
               /*  onTap: () async {
                  userViewModel.setSelectdUser(userModel);
                   openUserDetails(context);
                }, */
              );
            }));
  }
}
