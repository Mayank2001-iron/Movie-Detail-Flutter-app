import 'dart:html';

import 'package:movies3/Models/homeModel.dart';

class ApiState {

}
class ApiInitializeState extends ApiState{

}
class ApiLoadingState extends ApiState{

}
class ApiSuccessState extends ApiState{
  final List<HomeModel> homeModelList;
ApiSuccessState({required this.homeModelList});
}
class ApiErrorState extends ApiState{
  final String error;
  ApiErrorState({required this.error});
}