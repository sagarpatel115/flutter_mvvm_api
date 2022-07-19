import 'dart:convert';
import 'dart:io';
import 'package:sample_mvvm/data/app_exceptions.dart';
import 'package:sample_mvvm/data/network/BaseApiService.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices{

  @override
  Future getGetApiServices(String url)async{
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);

    }on SocketException{
      throw FetchDataException('No Internet Connection'); 
    }

     return responseJson;
  } 

  @override
  Future getPostApiServices(String url,dynamic data)async {
   
       dynamic responseJson;
    try{
        http.Response res = await http.post(
          Uri.parse(url),
          body: data
        ).timeout(Duration(seconds: 10));
       responseJson = returnResponse(res);
        }
    on SocketException{
      throw FetchDataException('No Internet Connection');
    }
 return responseJson;
     }
   dynamic returnResponse(http.Response response){

    switch(response.statusCode){
       case 200:
            dynamic resJson = jsonDecode(response.body);
            return resJson;
       case 400:
            throw BadRequestException(response.body.toString());     
       case 401:
            throw UnauthorisedException(response.body.toString()); 
       default:
            throw FetchDataException('Error during communication with server'+
            'with status code '+response.statusCode.toString());

    }
   

  }


}