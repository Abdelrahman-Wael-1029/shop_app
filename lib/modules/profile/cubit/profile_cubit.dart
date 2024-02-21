import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/profile/profile_model.dart';
import '../../../shared/constants/constant.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper/dio_helper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  ProfileModel? profileModel;

  void getProfile() {
    emit(GetProfileDataLoadingState());
    DioHelper.getData(
      url: Profile,
      token: Token,
    ).then((value) {
      if (value.data['status'] == false) {
        throw value.data['message'];
      }
      profileModel = ProfileModel.fromJson(value.data);
      emit(GetProfileDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetProfileDataErrorState(error.toString()));
    });
  }

  bool isUpdate = false;
  void updateProfile({
    required String email,
    required String name,
    required String phone,
  }) {
    isUpdate = true;
    emit(UpdateProfileDataLoadingState());
    print('$name $email $phone');
    DioHelper.putData(
      url: UpdateProfile,
      token: Token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      if (value.data['status'] == false) {
        throw value.data['message'];
      }
      profileModel = ProfileModel.fromJson(value.data);
      isUpdate = false;
      emit(UpdateProfileDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      isUpdate = false;
      emit(UpdateProfileDataErrorState(error.toString()));
    });
  }
}
