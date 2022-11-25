import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../providers/user_provider.dart';

class UserPage extends ConsumerStatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  ConsumerState<UserPage> createState() => _UserPageState();
}

class _UserPageState extends ConsumerState<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Page"),
      ),
      body: Center(
        child: ref
            .watch(
              userProvider(5),
            )
            .when(
              data: (data) => Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    radius: 90,
                    backgroundImage: NetworkImage(data!.avatar),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    data.firstName + " " + data.lastName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    data.email,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              error: (error, stackTrace) => Text("$error"),
              loading: () => const CircularProgressIndicator(),
            ),
      ),
    );
  }
}
