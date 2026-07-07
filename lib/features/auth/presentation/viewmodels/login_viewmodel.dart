import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpnapp/features/auth/domain/exceptions/auth_exception.dart';
import 'package:vpnapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:vpnapp/features/auth/presentation/state/auth_form_state.dart';

class LoginViewModel extends StateNotifier<AuthFormState> {
  LoginViewModel(this._authRepository) : super(const AuthFormIdle());

  final AuthRepository _authRepository;

  Future<void> signIn({required String email, required String password}) async {
    state = const AuthFormSubmitting();
    try {
      await _authRepository.signIn(email: email, password: password);
      state = const AuthFormSuccess();
    } on AuthException catch (error) {
      state = AuthFormFailure(error.message);
    }
  }
}
