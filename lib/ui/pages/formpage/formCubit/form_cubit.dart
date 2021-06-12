import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:veggy/util/regularExpressions/regular_expressions_models.dart';

part 'form_state.dart';

class FormCubit extends Cubit<FormCubitState> {
  FormCubit() : super(FormCubitState());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate(
          [email, state.userNameComplete, state.addres, state.phone]),
    ));
  }

  void userNameChanged(String value) {
    final userName = UserName.dirty(value);
    emit(state.copyWith(
      userNameComplete: userName,
      status:
          Formz.validate([userName, state.addres, state.email, state.phone]),
    ));
  }

  void phoneChanged(String value) {
    final phone = NumberPhone.dirty(value);
    emit(state.copyWith(
      phone: phone,
      status: Formz.validate(
          [phone, state.addres, state.email, state.phone, state.email]),
    ));
  }

  void addresChanged(String value) {
    final addres = AddrresForm.dirty(value);
    emit(state.copyWith(
      addres: addres,
      status: Formz.validate(
          [state.phone, addres, state.email, state.phone, state.email]),
    ));
  }
}
