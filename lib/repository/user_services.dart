import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sample_mvvm/data/network/BaseApiService.dart';
import 'package:sample_mvvm/data/network/NetworkApiServices.dart';
import 'package:sample_mvvm/resources/app_url.dart';

class UserService{

    final BaseApiServices _apiServices = NetworkApiServices();


  Future<dynamic> getUserDataApi() async{
    try{

      dynamic response = await _apiServices.getGetApiServices(AppUrl.USERS_LIST_API);
     
      return response;
    }catch(e){
       throw e;
    }
  }
}