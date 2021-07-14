import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veggy/data/production/repositories/email_repository.dart';

class EmailText extends StatelessWidget {

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: buildBoxDecoration(),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: ' Correo electrónico',
          suffix: TextButton(
            onPressed: () => _addEmail(_controller.text, context),
            child: Text('Enviar'),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
  );

  _addEmail(text, context) {
    //Aqui se debe manejar el correo que el usuario ingresó.
    var repReference = EmailRepository();
    repReference.saveEmail(text);
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 3), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            title: Text('Gracias por brindarnos tu correo'),
            content: Text('Te haremos llegar información de promociones por este medio.'),
          );
        }
    );

    _controller.text = "";
  }
}