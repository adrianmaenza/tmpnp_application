import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tmpnp_event.dart';
part 'tmpnp_state.dart';

class TmpnpBloc extends Bloc<TmpnpEvent, TmpnpState> {
  TmpnpBloc() : super(TmpnpInitial()) {
    on<TmpnpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
