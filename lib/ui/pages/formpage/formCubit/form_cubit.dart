import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:veggy/domain/models/cart_product.dart';
import 'package:veggy/domain/models/preorder.dart';
import 'package:veggy/util/regularExpressions/regular_expressions_models.dart';

part 'form_state.dart';

class FormCubit extends Cubit<FormCubitState> {
  FormCubit() : super(FormCubitState());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate(
          [email, state.userNameComplete, state.addres, state.phone, state.id]),
    ));
  }

  void userNameChanged(String value) {
    final userName = UserName.dirty(value);
    emit(state.copyWith(
      userNameComplete: userName,
      status: Formz.validate(
          [userName, state.addres, state.email, state.phone, state.id]),
    ));
  }

  void phoneChanged(String value) {
    final phone = NumberPhone.dirty(value);
    emit(state.copyWith(
      phone: phone,
      status: Formz.validate([
        phone,
        state.addres,
        state.email,
        state.phone,
        state.email,
        state.id
      ]),
    ));
  }

  void addresChanged(String value) {
    final addres = AddrresForm.dirty(value);
    emit(state.copyWith(
      addres: addres,
      status: Formz.validate([
        state.phone,
        addres,
        state.email,
        state.phone,
        state.email,
        state.id
      ]),
    ));
  }

  void idChanged(String value) {
    final id = NumberNoEmpty.dirty(value);
    emit(state.copyWith(
      id: id,
      status: Formz.validate([
        state.phone,
        state.addres,
        state.email,
        state.phone,
        state.email,
        id
      ]),
    ));
  }

  void sendPreOrder(List<CartProduct> listProduct) {
    if (state.status == FormzStatus.invalid) return;
    final preOrder = PreOrder(
      bodega: '',
      cargoEnvio: 0,
      cedula: state.id.value,
      detalles: [],
      email: state.email.value,
      nombreCliente: state.userNameComplete.value,
      codigoCliente: '',
      fechaHora: DateTime.now().toString(),
      notas: '',
      ordenCompra: '',
      tipoCedula: 'i',
    );
    listProduct.forEach((product) {
      preOrder.detalles.add(product.product);
    });
  }
}
