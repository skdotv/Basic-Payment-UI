import 'package:assignment/payment/bloc/payment_bloc.dart';
import 'package:assignment/payment/screens/payment_detail_screen.dart';
import 'package:flutter/material.dart';

class PayementScreen extends StatelessWidget {
  final PaymentBloc bloc = PaymentBloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (value) =>
                        value.isEmpty ? "Amount field is required" : null,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      bloc.amount = value;
                    },
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.red,
                        wordSpacing: 5.0,
                      ),
                      isDense: true,
                      labelText: "Enter Amount",
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          borderSide: BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate())
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentDetailScreen(
                                  bloc: this.bloc,
                                )));
                },
                color: Colors.blue,
                child: Text(
                  "Enter",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
