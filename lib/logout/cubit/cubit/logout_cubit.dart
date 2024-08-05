import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_api/core/api/api_consumer.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.api) : super(LogoutInitial());

  final ApiConsumer api;
  



}
