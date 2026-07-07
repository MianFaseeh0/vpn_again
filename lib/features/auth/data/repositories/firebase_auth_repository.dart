import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:vpnapp/features/auth/domain/entities/app_user.dart';
import 'package:vpnapp/features/auth/domain/exceptions/auth_exception.dart';
import 'package:vpnapp/features/auth/domain/repositories/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository({fb.FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? fb.FirebaseAuth.instance;

  final fb.FirebaseAuth _firebaseAuth;

  @override
  Stream<AppUser?> get authStateChanges {
    return _firebaseAuth.authStateChanges().map(_toAppUser);
  }

  @override
  Future<void> signIn({required String email, required String password}) {
    return _run(
      () => _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
      fallbackMessage: 'An error occurred while signing in.',
    );
  }

  @override
  Future<void> signUp({required String email, required String password}) {
    return _run(
      () => _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ),
      fallbackMessage: 'Signup failed. Please try again.',
    );
  }

  @override
  Future<void> signOut() => _firebaseAuth.signOut();

  AppUser? _toAppUser(fb.User? user) {
    if (user == null) return null;
    return AppUser(uid: user.uid, email: user.email);
  }

  Future<void> _run(
    Future<void> Function() action, {
    required String fallbackMessage,
  }) async {
    try {
      await action();
    } on fb.FirebaseAuthException catch (error) {
      throw AuthException(_messageFor(error) ?? fallbackMessage);
    } catch (_) {
      throw AuthException('Something went wrong, please try again.');
    }
  }

  String? _messageFor(fb.FirebaseAuthException error) {
    switch (error.code) {
      case 'email-already-in-use':
        return 'This email is already in use.';
      case 'invalid-email':
        return 'This email address is invalid.';
      case 'weak-password':
        return 'Password should be at least 6 characters.';
      default:
        return error.message;
    }
  }
}
