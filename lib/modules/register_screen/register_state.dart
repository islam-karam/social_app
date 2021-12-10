part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}


class RegisterLoadingState extends RegisterState {}
class RegisterSuccessState extends RegisterState {}
class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState(this.error);
}


class CreateSuccessState extends RegisterState {}
class CreateErrorState extends RegisterState {
  final String error;

  CreateErrorState(this.error);
}


class ChangePasswordRegisterState extends RegisterState {}