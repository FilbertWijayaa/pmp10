import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fw/params/game_params.dart';
import 'package:fw/response/game_create_response.dart';

class GameRepository {
  Future<GameCreateResponse> addGame(GameParam gameParam)async{
    try{
      var response = await Dio().post('https://voucher.crabytech.com/api/game/',
          data: gameParam.toJson());
      debugPrint('Response POST : ${response.data}');
      return GameCreateResponse.fromJson(response.data);
    }on DioException catch(e){
      throw Exception(e);
    }
  }
}