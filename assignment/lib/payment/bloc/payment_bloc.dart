import 'package:assignment/payment/model/payment_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rxdart/rxdart.dart';

class PaymentBloc {
  PaymentBloc() {
    getCardDetail();
  }

// variable
  String amount;
  PaymentModel paymentModel;

// get api data
  void getCardDetail() async {
    http.Response response = await http.get("https://api.mocki.io/v1/488c4a8d");
    Map<String, dynamic> respoBody = json.decode(response.body);
    paymentModel = PaymentModel.fromJson(respoBody);
    print(paymentModel);
  }

  PaymentModel getPaymentModel() {
    if (paymentModel != null) {
      return paymentModel;
    }
  }
}

class RadioButtonBloc {
  final radioController = BehaviorSubject<int>.seeded(0);

  void dispose() {
    radioController.close();
  }
}
