import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpnapp/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:vpnapp/features/auth/domain/entities/app_user.dart';
import 'package:vpnapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:vpnapp/features/auth/presentation/state/auth_form_state.dart';
import 'package:vpnapp/features/auth/presentation/viewmodels/login_viewmodel.dart';
import 'package:vpnapp/features/auth/presentation/viewmodels/signup_viewmodel.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return FirebaseAuthRepository();
});

final authStateProvider = StreamProvider<AppUser?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
});

final loginViewModelProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, AuthFormState>((ref) {
      return LoginViewModel(ref.watch(authRepositoryProvider));
    });

final signupViewModelProvider =
    StateNotifierProvider.autoDispose<SignupViewModel, AuthFormState>((ref) {
      return SignupViewModel(ref.watch(authRepositoryProvider));
    });
