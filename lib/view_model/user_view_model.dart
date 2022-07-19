

import 'package:flutter/cupertino.dart';
import 'package:sample_mvvm/model/user_list_model.dart';
import 'package:sample_mvvm/repository/user_services.dart';
import 'package:sample_mvvm/utils/utils.dart';

class UserViewModel extends ChangeNotifier{

 final _myRepo = UserService(); 

  bool _loading = false;
  List<UserModel> _userListModel = [];
 
  UserModel? _selectedUser;
  UserModel? _addingUser;

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  
  UserModel get selectedUser => _selectedUser!;
  UserModel get addingUser => _addingUser!;


  UserViewModel(){
    getUsers();
  }

  setLoading(bool val){
    _loading = val;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel){
    _userListModel = userListModel;
  }

 

  setSelectdUser(UserModel userModel){
    _selectedUser = userModel;
  }

    setaddUser(UserModel userModel){
    _addingUser = userModel;
  }

    addUser()async{
    if(!isValid()){
      return false;
    }
    _userListModel.add(addingUser);
    _addingUser = UserModel();
    notifyListeners();
    return true;
  }

  isValid(){
    if(addingUser.name == null || addingUser.name!.isEmpty){
      return false;
    }
    if(addingUser.email == null || addingUser.email!.isEmpty){
      return false;
    }
    return true;
  }

/*   getUsers()async{
    setLoading(true);
    var response = await UserService.getUsers();
    if(response is Success){
      setUserListModel(response.response as List<UserModel>);
    }
    if(response is Failer){
      UserError userError = UserError(
        code:  response.code,
        message: response.errorRes
      );
      setUserError(userError);
    }
    setLoading(false);
  } */

  Future<void> getUsers()async{
    print('get users appi call');
        setLoading(true);
        _myRepo.getUserDataApi().then((value) {
            setLoading(false);
            //Navigator.pushNamed(context,RoutesName.home),
            List<UserModel> userListModelFromJson = List<UserModel>.from(value.map((x) => UserModel.fromJson(x)));
            print("#==>"+value.toString());
           
            setUserListModel(userListModelFromJson);
            
        }).onError((error, stackTrace)  {
            setLoading(false);
             Utils.toastMessage(error.toString());
               debugPrint(error.toString());
            
        });
    }


}