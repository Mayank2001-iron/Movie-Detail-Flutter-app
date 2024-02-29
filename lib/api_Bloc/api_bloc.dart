
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies3/UserBloc/User_Bloc.dart';
import 'package:movies3/UserBloc/User_Event.dart';
import 'package:movies3/api_Bloc/api_event.dart';
import 'package:movies3/api_Bloc/api_state.dart';
import 'package:movies3/repository/user_repository.dart';

class ApiBloc extends Bloc<ApiEvent,ApiState>
{
  final UserRepository userRepository;
  ApiBloc({required this.userRepository}):super(ApiInitializeState())
  {
    on<ApiLoadEvent>((event, emit) async{
      emit(ApiLoadingState());
      try {
        final user = await userRepository.getData();
        emit(ApiSuccessState(homeModelList: user));
      } catch (e) {
        emit(ApiErrorState(error: e.toString()));
      }
    });
  }

}