// import 'package:electronic_accessories_app/model/profile_model.dart';
// import 'package:electronic_accessories_app/model/user.dart';
// import 'package:electronic_accessories_app/repository/userrepository.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   late UserRepository? userRepository;
//   setUp(() {
//     userRepository = UserRepository();
//   });
//   test('user registration', () async {
//     bool expectedResult = true;
//     User user = User(
//         name: "Lgsamsung",
//         email: "LGSamsungppt@example.com",
//         password: "123456789");
//     bool actualResult = await userRepository!.registerUser(user);
//     expect(actualResult, expectedResult);
//   });

//   test('user login', () async {
//     bool expectedresult = true;
//     bool actualresult =
//         await UserRepository().login('nitesh.karki31@gmail.com', '123456789');
//     expect(expectedresult, actualresult);
//   });

//   test('get profile', () async {
//     ResponseUserProfile? profile =
//         await UserRepository().userprofile("62e68ddd35ab9ac7c5cf0808");
//     bool expectedResult = true;
//     bool actualResult = false;
//     if (profile!.q.isNotEmpty) {
//       actualResult = true;
//     }
//     expect(expectedResult, actualResult);
//   });

//   test('update profile', () async {
//     bool profile = await UserRepository().updateuserprofile(
//         "email", "khadka448@gmail.com", "62e68ddd35ab9ac7c5cf0808");
//     bool expectedResult = true;
//     bool actualResult = false;
//     if (profile) {
//       actualResult = true;
//     }
//     expect(expectedResult, actualResult);
//   });

//   tearDown(() {
//     userRepository = null;
//   });
// }
