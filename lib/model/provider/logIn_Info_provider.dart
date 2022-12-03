import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/user.dart';
import 'package:merubo/model/repository/auth_repository.dart';


// class LogInInfoProvider extends StateNotifier<User> {
//   final Ref ref;
//
//   LogInInfoProvider(this.ref) : super(const User(id: ""))
//
//   void manageCurrentUserState(){
//     final currentUser = ref.read(authProvider).currentUser();
//   }
//
// }