import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_api/models/user_model.dart';
import 'package:flutter_riverpod_api/repositories/user_repository.dart';

var userRepositoriesProvider = Provider(
  (ref) => UserRepository(),
);

var userProvider = FutureProvider<UserModel?>(
  (ref) => ref.watch(userRepositoriesProvider).getUser(2),
);
