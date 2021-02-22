class PaymentOption {
  final String payopt;
  final String desc;

  PaymentOption({this.payopt, this.desc});

  PaymentOption.fromJson(Map<String, dynamic> map)
      : payopt = map['payOpt'],
        desc = map['payOptDesc'];

  static List<PaymentOption> fromMapArrObject(List<dynamic> map) {
    List<PaymentOption> _list = [];
    map
        .map((item) => _list.add(PaymentOption(
              payopt: item['payOpt'],
              desc: item['payOptDesc'],
            )))
        .toList();

    return _list ?? [];
  }
}
