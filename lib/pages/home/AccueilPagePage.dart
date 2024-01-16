import 'package:flutter/material.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';

class AccueilPagePage extends StatelessWidget {
  const AccueilPagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }

  _body() {
    return Container(
      color: Colors_App.Colorverte,
    );
  }
}
