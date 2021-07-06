import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggy/ui/pages/formpage/formCubit/form_cubit.dart';
import 'package:veggy/ui/pages/formpage/widgets/background_veggy.dart';
import 'package:veggy/ui/pages/formpage/widgets/custom_title.dart';
import 'package:veggy/ui/pages/formpage/widgets/form_preorder.dart';

class FormPreorderPage extends StatelessWidget {
  const FormPreorderPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final preorderForm = FormPreOrder();
    return BlocProvider(
      create: (context) => FormCubit(),
      child: Scaffold(
          body: Scrollbar(
        // isAlwaysShown: true,
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            (size.width > 1000)
                ? _DesktopBody(child: preorderForm)
                : _MobileBody(child: preorderForm),

            // LinksBar
          ],
        ),
      )),
    );
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;

  const _MobileBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 24, left: 24, top: 24),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            child: Column(
              children: [
                CustomTitle(),
                SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: 550,
                  child: child,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.97,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Twitter Background
          Expanded(child: Background()),

          // View Container

          Container(
            width: 600,
            alignment: Alignment.center,
            height: double.infinity,
            child: Container(
              width: 500,
              height: 670,
              child: Card(
                child: Column(
                  children: [
                    CustomTitle(),
                    SizedBox(height: 24),
                    Expanded(child: child),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
