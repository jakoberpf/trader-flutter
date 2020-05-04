// Define a custom Form widget.
import 'package:best_flutter_ui_templates/trader_list/widget/text_input_form.dart';
import 'package:flutter/material.dart';

class AddTraderForm extends StatefulWidget {
  final AnimationController animationController;

  AddTraderForm(this.animationController);

  @override
  AddTraderFormState createState() {
    return AddTraderFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class AddTraderFormState extends State<AddTraderForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextInputFormView(
            animation:
                Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController,
                    curve: Interval((1 / 2) * 3, 1.0, curve: Curves.fastOutSlowIn)
            )),
            animationController: widget.animationController,
            name: "EXCHANGE",
            description: "Select your exchange\nBinance, Crypto, Comdirect, ...",
            help: 'Enter your exchange',
          ),
          TextInputFormView(
            animation:
            Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                parent: widget.animationController,
                curve: Interval((1 / 2) * 3, 1.0, curve: Curves.fastOutSlowIn)
            )),
            animationController: widget.animationController,
            name: "MARKET",
            description: "Select your market\nbtcusdt, ltcusdt, ethusdt, ...",
            help: 'Enter your market',
          ),
          TextInputFormView(
            animation:
            Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                parent: widget.animationController,
                curve: Interval((1 / 2) * 3, 1.0, curve: Curves.fastOutSlowIn)
            )),
            animationController: widget.animationController,
            name: "INTERVAL",
            description: "Select your exchange\nBinance, Crypto, Comdirect, ...",
            help: 'Enter your exchange',
          ),// Add TextFormFields and RaisedButton here.
        ]));
  }
}
