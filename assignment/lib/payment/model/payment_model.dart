import 'package:assignment/payment/model/payment_option_model.dart';
import 'package:assignment/payment/model/saved_card_model.dart';

class PaymentModel {
  final List<SavedCardModel> savedCardModel;
  final List<PaymentOption> paymentOptions;

  PaymentModel({this.savedCardModel, this.paymentOptions});

  PaymentModel.fromJson(Map<String, dynamic> map)
      : savedCardModel = SavedCardModel.fromMapArrObject(map['savedCard']),
        paymentOptions = PaymentOption.fromMapArrObject(map['payOptions']);
}
