import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/ui/view/splsah/splash_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  Widget build(BuildContext context) {
    bool loading = ref.watch(splashViewModelProvider).isLoading;
    return const Scaffold(
      body: Visibility(
        visible: loading ?? true,
          child: CircularProgressIndicator()),
    );
  }
}
