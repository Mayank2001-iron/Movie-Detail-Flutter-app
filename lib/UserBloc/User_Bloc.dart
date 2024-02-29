

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies3/UserBloc/User_Event.dart';
import 'package:movies3/UserBloc/User_State.dart';

class UserBloc extends Bloc<UserEvent,User>
{
  UserBloc():super(User(NofavMovie:0,NofavShow: 0))
  {
    on<UserAddFavMovieEvent>((event,emit)
    {
      emit(User(NofavMovie: state.NofavMovie+1,NofavShow: state.NofavShow));
    });
    on<UserAddFavShowEvent>((event,emit)
    {
      emit(User(NofavMovie: state.NofavMovie, NofavShow: state.NofavShow+1));
    });
  }
}