import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_api/models/user_model.dart';
import 'package:flutter_riverpod_api/repositories/user_repository.dart';

var userRepositoriesProvider = Provider(
  (ref) => UserRepository(),
);

var userProvider =
    FutureProvider.autoDispose.family<UserModel?, int>((ref, id) async {
  var user = ref.watch(userRepositoriesProvider).getUser(id);
  ref.keepAlive();
  return user;
});
