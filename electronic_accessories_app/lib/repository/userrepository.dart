import 'package:electronic_accessories_app/api/user_api.dart';
import 'package:electronic_accessories_app/model/profile_model.dart';
import 'package:electronic_accessories_app/model/user.dart';

class UserRepository {
  Future<bool> registerUser(User user) async {
    return await UserAPI().registerUser(user);
  }

  Future<bool> login(String email, String password) {
    return UserAPI().login(email, password);
  }

  Future<ResponseUserProfile?> userprofile() {
    return UserAPI().getUserProfile();
  }

  Future<bool> updateuserprofile(String datatype, String data) async {
    return await UserAPI().updateUserProfile(datatype, data);
  }
}
