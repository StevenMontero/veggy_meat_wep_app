part of 'form_cubit.dart';

class FormCubitState extends Equatable {
  final Email email;
  final UserName userNameComplete;
  final AddrresForm addres;
  final NumberPhone phone;
  final FormzStatus status;
  const FormCubitState({
    this.userNameComplete = const UserName.pure(),
    this.addres = const AddrresForm.pure(),
    this.phone = const NumberPhone.pure(),
    this.email = const Email.pure(),
    this.status = FormzStatus.pure,
  });

  FormCubitState copyWith({
    Email? email,
    UserName? userNameComplete,
    AddrresForm? addres,
    NumberPhone? phone,
    FormzStatus? status,
  }) {
    return FormCubitState(
      email: email ?? this.email,
      userNameComplete: userNameComplete ?? this.userNameComplete,
      addres: addres ?? this.addres,
      phone: phone ?? this.phone,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, userNameComplete, addres, phone, status];
}
