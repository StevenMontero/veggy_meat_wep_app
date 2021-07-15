import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:veggy/data/production/repositories/qupos_server_repository.dart';
import 'package:veggy/data/production/repositories/sms_notifications_repo.dart';
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
      status: Formz.validate(
          [phone, state.addres, state.email, state.email, state.id]),
    ));
  }

  void addresChanged(String value) {
    final addres = AddrresForm.dirty(value);
    emit(state.copyWith(
      addres: addres,
      status: Formz.validate(
          [state.phone, addres, state.email, state.email, state.id]),
    ));
  }

  void idChanged(String value) {
    final id = NumberNoEmpty.dirty(value);
    emit(state.copyWith(
      id: id,
      status: Formz.validate(
          [state.phone, state.addres, state.email, state.email, id]),
    ));
  }

  void sendPreOrder(List<CartProduct> listProduct) async {
    if (state.status == FormzStatus.invalid) return;
    final repoQupos = QuposRepository();
    final repoNotidications = SmsNotificationRepository();
    final preOrder = PreOrder(
      bodega: "001",
      cargoEnvio: 0,
      cedula: state.id.value,
      detalles: [],
      email: state.email.value,
      nombreCliente: state.userNameComplete.value,
      codigoCliente: '',
      fechaHora: DateTime.now().toString(),
      notas: 'Numero de telefono: +506 ${state.phone.value}',
      ordenCompra: state.id.value + DateTime.now().toString(),
      tipoCedula: 'F',
    );
    listProduct.forEach((product) {
      preOrder.detalles.add(product.product);
    });
    repoQupos.postPreventa(preOrder);

    final message =
        'Buenos días. He realizado una compra en la página de Veggy.\nNombre: ${state.userNameComplete.value}\nCédula: ${state.id.value}\nTeléfono: ${state.phone.value}\nFecha: ${DateTime.now().toString()}.\nPor favor confirmar si recibieron el pedido.';
    repoNotidications.sendWhatsappNotification(message, state.phone.value);
    await canLaunch(_url(message))
        ? await launch(_url(message))
        : print('Could not launch $_url');
  }

  String _url(String message) {
    return "https://api.whatsapp.com/send?phone=${'+506 ' + '89395313'}&text=$message"; // new line
  }
}
