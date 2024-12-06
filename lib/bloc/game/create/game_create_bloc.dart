import 'package:bloc/bloc.dart';
import 'package:fw/params/game_params.dart';
import 'package:meta/meta.dart';

import '../../../response/game_create_response.dart';

part 'game_create_event.dart';
part 'game_create_state.dart';

class GameCreateBloc extends Bloc<GameCreateEvent, GameCreateState> {
  GameCreateBloc() : super(GameCreateInitial()) {
    on<GameCreateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
