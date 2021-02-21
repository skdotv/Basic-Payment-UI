import 'package:assignment/payment/bloc/payment_bloc.dart';
import 'package:assignment/payment/constants.dart';
import 'package:assignment/payment/widget/common_widget.dart';
import 'package:flutter/material.dart';

class PaymentDetailScreen extends StatefulWidget {
  final PaymentBloc bloc;
  const PaymentDetailScreen({Key key, this.bloc}) : super(key: key);

  @override
  _PaymentDetailScreenState createState() =>
      _PaymentDetailScreenState(this.bloc);
}

class _PaymentDetailScreenState extends State<PaymentDetailScreen>
    with SingleTickerProviderStateMixin {
  final PaymentBloc _bloc;
  _PaymentDetailScreenState(this._bloc);

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: kAppColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Payment Details",
              style: TextStyle(fontSize: 20),
            ),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 1),
                color: kAppColor,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "AED ${this._bloc?.amount ?? ""}",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " Order #:myntra_123141423453",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[400]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    couponWidget(),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              TabBar(
                labelColor: Colors.blue[300],
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                controller: _tabController,
                indicator: BoxDecoration(
                  color: Colors.transparent,
                ),
                isScrollable: true,
                unselectedLabelColor: Colors.grey[600],
                tabs: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Tab(
                      text: "Billing",
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Tab(
                      text: "Shipping",
                    ),
                  ),
                  Tab(
                    text: "Promotions & Offers",
                  )
                ],
              ),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              commonTextBox(
                                text: "Vinod Khadka",
                                color: Colors.grey[800],
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                              commonTextBox(
                                  text: "Edit",
                                  color: Colors.blue[300],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  textDecoration: TextDecoration.underline),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          commonTextBox(
                            text:
                                "Avenues India Pvt. Ltd. Level 11, Plaza Asia,S.V.Road, Santa Cruz(West), Mumbai - 400054, INDIA",
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                          commonTextBox(
                            text: "+971 554422423",
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          commonTextBox(
                            text: "dummy@gmail.com",
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          commonTextBox(
                              text: "Choose Payment Option",
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          Column(
                            children: List.generate(
                                4,
                                (index) => Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border.all(
                                          width: 0.5,
                                          color: Colors.grey[500],
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      margin: EdgeInsets.only(top: 10),
                                      child: ExpansionTile(
                                        leading: Icon(
                                          Icons.credit_card_outlined,
                                          color: Colors.indigo,
                                          size: 30.0,
                                        ),
                                        title: commonTextBox(
                                          text: "Saved Card",
                                          color: Colors.grey[700],
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        children: [
                                          cardDetailWidget(),
                                          cardDetailWidget(),
                                          cardDetailWidget(),
                                          cardDetailWidget(),
                                        ],
                                      ),
                                    )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Text("2"),
                  ),
                  Center(
                    child: Text("3"),
                  )
                ]),
              )
            ],
          )),
    );
  }

  Widget couponWidget() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter Coupon Code",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.red)),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
          RaisedButton(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            )),
            onPressed: () {},
            color: Colors.deepOrange[600],
            child: Text(
              "Apply",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          )
        ],
      );

  Widget cardDetailWidget() => Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 20,
                top: 5,
                bottom: 5,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                      activeColor: Colors.blue[300],
                      value: 1,
                      groupValue: 1,
                      onChanged: (value) {}),
                  Icon(
                    Icons.credit_card_outlined,
                    color: Colors.deepPurple,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      commonTextBox(
                        text: "xxxxxxxxxxxxx0789",
                        color: Colors.grey[700],
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      commonTextBox(
                        text: "Vinod Khadka",
                        color: Colors.grey[700],
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.18,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "CVV",
                        hintStyle: TextStyle(
                          fontSize: 14,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.grey[400]),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.grey[400]),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: RaisedButton(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: () {},
                color: Colors.red,
                child: commonTextBox(
                    color: Colors.white,
                    fontSize: 16,
                    text: "PAY AED ${this._bloc.amount}"),
              ),
            )
          ],
        ),
      );
}
