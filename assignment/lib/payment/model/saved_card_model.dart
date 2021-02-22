class SavedCardModel {
  final int payOptID;
  final String payCardNo;
  final String paymentOpt;
  final String payCardname;
  final String payCardType;

  SavedCardModel({
    this.payOptID,
    this.payCardNo,
    this.paymentOpt,
    this.payCardname,
    this.payCardType,
  });

  SavedCardModel.fromJson(Map<String, dynamic> map)
      : payOptID = map['payOptId'],
        payCardNo = map['payCardNo'],
        paymentOpt = map['payOption'],
        payCardname = map['payCardName'],
        payCardType = map['payCardType'];

  static List<SavedCardModel> fromMapArrObject(List<dynamic> map) {
    List<SavedCardModel> _list = [];
    map
        .map((item) => _list.add(SavedCardModel(
              payOptID: item['payOptId'],
              payCardNo: item['payCardNo'],
              paymentOpt: item['payOption'],
              payCardname: item['payCardName'],
              payCardType: item['payCardType'],
            )))
        .toList();

    return _list ?? [];
  }
}
