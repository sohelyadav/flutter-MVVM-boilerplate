import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseViewModel extends StateNotifier{
  BaseViewModel() : super(null);

  final bool _isLoading = false;

  bool get isLoading  => _isLoading;

    setLoading(bool isLoading){
      state = isLoading;
    }
}

