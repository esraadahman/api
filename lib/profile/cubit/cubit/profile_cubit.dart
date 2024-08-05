import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_api/cache/cache_healper.dart';
import 'package:project_api/core/api/api_consumer.dart';
import 'package:project_api/core/api/endPointes.dart';
import 'package:project_api/core/errors/exceptions.dart';
import 'package:project_api/profile/model/usermodel.dart';
import 'package:project_api/repositories/user_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.userrepo) : super(ProfileInitial());

  final userRepo userrepo;

  getuserProfile() async {
    emit(GetUserLoading());
    final response = await userrepo.getUserProfile();
    response.fold(
      (errMessage) => emit(GetUserFailure(errMessage: errMessage)),
      (user) => emit(GetUserSuccess(user: user)),
    );
  }

  //  getdataChach() async{
  // //  print("enter function");
  //   emit(GetUserLoading());
  //   data[ApiKey.email] =await CacheHelper().getData(key: ApiKey.email);
  //   data[ApiKey.name] =await CacheHelper().getData(key: ApiKey.name);
  //   data[ApiKey.token] = await CacheHelper().getData(key: ApiKey.token);
  // //  print("email ${data[ApiKey.email]}   name ${data[ApiKey.name]}  token ${data[ApiKey.token]}");
  //   emit(GetuserSuccess());
  // //  print("end function ");

  // }

//  final Map<String, dynamic> data = {};
  getdataChach() async {
    emit(GetUserLoading());
  final  data =await userrepo.getdataChach();
    data.fold((errormessage) {
      
      emit(GetUserFailure(errMessage: errormessage));
    }, (data) {
      emit(GetuserSuccess(data: data));
    });
  }




  
}
