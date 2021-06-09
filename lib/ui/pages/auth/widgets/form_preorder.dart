import 'package:flutter/material.dart';
import 'package:veggy/ui/widgets/custom_inputs.dart';
import 'package:veggy/ui/widgets/outline_custom_buttom.dart';

class FormPreOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 0),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 370),
          child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Email
                  TextFormField(
                    onFieldSubmitted: (_) => () {},
                    validator: (value) {
                      // if( !EmailValidator.validate(value ?? '') ) return 'Email no válido';

                      // return null;
                    },
                    onChanged: (value) => print(value),
                    style: TextStyle(color: Colors.white),
                    decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su nombre completo',
                        label: 'Nombre completo',
                        icon: Icons.person_outline),
                  ),

                  SizedBox(height: 20),

                  // Password
                  TextFormField(
                    onFieldSubmitted: (_) {},
                    onChanged: (value) {},
                    validator: (value) {
                      // if ( value == null || value.isEmpty ) return 'Ingrese su contraseña';
                      // if ( value.length < 6 ) return 'La contraseña debe de ser de 6 caracteres';

                      // return null; // Válido
                    },
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su email',
                        label: 'Email',
                        icon: Icons.email_outlined),
                  ),

                  SizedBox(height: 20),
                  TextFormField(
                    onFieldSubmitted: (_) {},
                    onChanged: (value) {},
                    validator: (value) {
                      // if ( value == null || value.isEmpty ) return 'Ingrese su contraseña';
                      // if ( value.length < 6 ) return 'La contraseña debe de ser de 6 caracteres';

                      // return null; // Válido
                    },
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su dirección de domicilio ',
                        label: 'Dirección',
                        icon: Icons.location_city_outlined),
                  ),
                   SizedBox(height: 20),
                   TextFormField(
                    onFieldSubmitted: (_) {},
                    onChanged: (value) {},
                    validator: (value) {
                      // if ( value == null || value.isEmpty ) return 'Ingrese su contraseña';
                      // if ( value.length < 6 ) return 'La contraseña debe de ser de 6 caracteres';

                      // return null; // Válido
                    },
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su numero telefónico',
                        label: 'Teléfono',
                        icon: Icons.phone_outlined),
                  ),
                   SizedBox(height: 24),
                  CustomOutlinedButton(
                    onPressed: () {},
                    text: 'Enviar orden',
                  ),

                  
                ],
              )),
        )));
  }
}
