part of 'AuthBloc.dart';
abstract class AuthEvent extends Equatable{}
class LoginEvent extends AuthEvent{
  final String phone;
  final String pass;
  LoginEvent({required this.phone,required this.pass});
  @override
  // TODO: implement props
  List<Object?> get props => [phone,pass];
}
class RegisterEvent extends AuthEvent{
  final String name;
  final String phone;
  final String pass;
  RegisterEvent({required this.name,required this.phone,required this.pass});
  @override
  // TODO: implement props
  List<Object?> get props => [name,phone,pass];
}
class FetchProfileEvent extends AuthEvent{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class UpdateProfileEvent extends AuthEvent{
  final String? name;
  final String? phone;
  final File? file;
  UpdateProfileEvent({this.name,this.phone,this.file});
  @override
  // TODO: implement props
  List<Object?> get props =>[name,phone,file];
}