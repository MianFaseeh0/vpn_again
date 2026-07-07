sealed class AuthFormState {
  const AuthFormState();
}

class AuthFormIdle extends AuthFormState {
  const AuthFormIdle();
}

class AuthFormSubmitting extends AuthFormState {
  const AuthFormSubmitting();
}

class AuthFormSuccess extends AuthFormState {
  const AuthFormSuccess();
}

class AuthFormFailure extends AuthFormState {
  const AuthFormFailure(this.message);

  final String message;
}
