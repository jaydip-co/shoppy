import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import 'package:shoppy/Common/Appbar/CommonAppbar.dart';
import 'package:shoppy/Common/CommomAssets.dart';
import 'package:shoppy/Model/CartModel.dart';
import 'package:shoppy/Model/ItemModel.dart';
import 'package:shoppy/Model/OrderModel.dart';
import 'package:shoppy/Screens/ConfirmAddress.dart';
import 'package:shoppy/Screens/ConfirmeCartOrder.dart';
import 'package:shoppy/Screens/LoadingWidget.dart';
import 'package:shoppy/Services/DatabaseService.dart';
import 'package:shoppy/TempDatabse.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int price = 100;
  bool isSelectedAll = false;
  int qty = 1;
  double totalprice = 0;
  List<CartModel> cardModel = [];
  List<double> quantities = [];

  @override
  void initState() {
    super.initState();
    calculateTotal();
  } // List<ItemModel> itemModel = [
  //   // ItemModel.of(TempDatabase.GroceryMap['products'][4],"ref"),
  //   // ItemModel.of(TempDatabase.GroceryMap['products'][6],"ref"),
  // ];

  @override
  Widget build(BuildContext context) {
    //totalprice = qty *price;
    final size = MediaQuery.of(context).size;
    final database = Provider.of<DatabaseService>(context, listen: false);
    return Stack(children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 26, top: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    selectAll();
                    // for(CartModel c in cardModel)
                    //   print(c.toString());
                  },
                  child: Text(
                    "All",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  children: [
                    Text("Total :  "),
                    Text(
                      totalprice.toString(),
                      style: TextStyle(color: Colors.green, fontSize: 30),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<CartModel>>(
                stream: database.getCartItems,
                builder: (con, data) {
                  if (!data.hasData) return LoadingVidget();
                  cardModel = data.data;

                  return RefreshIndicator(
                    onRefresh: () {
                      return database.refressCart();
                    },
                    child: ListView.builder(
                      itemCount: data.data.length,
                      itemBuilder: (con, ind) {
                        return getOneCartItem(data.data[ind], size, ind);
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
      if (totalprice != 0)
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              child: Icon(Icons.shopping_bag),
              onPressed: () {
                List<OrderModel> modeles = [];
                final customer = database.customer;
                for (CartModel c in cardModel) {
                  if (c.selected) {
                    OrderModel mod = OrderModel.fromItem(c);
                    mod.orderTime = "time";
                    mod.customerName =
                        customer.firstNAme + " " + customer.lastName;
                    mod.status = "status";
                    modeles.add(mod);
                  }
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => ConfirmCartOrder(
                              ordermodel: modeles,
                            )));
              },
            ),
          ),
        )
    ]);
  }

  void calculateTotal() {
    totalprice = 0;
    for (CartModel m in cardModel) {
      if (m.selected) {
        totalprice = totalprice + m.totalAmount;
      }
      print(m.toString());
    }
    if (mounted) {
      setState(() {});
    }
  }

  void selectAll() {
    print("clicked");
    if (isSelectedAll) {
      for (CartModel m in cardModel) {
        m.selected = false;
      }
      calculateTotal();
    } else {
      for (CartModel m in cardModel) {
        m.selected = true;
      }
      calculateTotal();
    }
    isSelectedAll = !isSelectedAll;
    setState(() {});
  }

  void calculateCheck(int index) {
    cardModel[index].selected = !cardModel[index].selected;
    calculateTotal();
    // setState(() {});
  }

  Widget getOneCartItem(CartModel itemModel, Size size, int index) {
    // if(itemModel.sellingType == "Wieght")
    final width = size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          calculateCheck(index);
        },
        child: Card(
          elevation: .5,
          child: Container(
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10.0),
              //     border: Border.all(color: Theme.of(context).primaryColor)),
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                  value: cardModel[index].selected,
                  onChanged: (cal) {
                    calculateCheck(index);
                  }),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width * 0.30,
                          height: size.height * 0.13,
                          child: Image.asset(
                            'asset/Icon.jpg',
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              itemModel.productName,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.025,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Text(
                              totalprice.toString(),
                              style: TextStyle(fontSize: size.height * 0.02),
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Text(
                              "In Stock",
                              style: TextStyle(fontSize: size.height * 0.02),
                            ),
                          ],
                        ))
                      ],
                    ),
                    // QuantityConfirm(oneItem: itemModel, orderModel: OrderModel())
                    QuantitySelector(
                      cartModel: itemModel,
                      reffress: () {
                        calculateTotal();
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("price you have to pay : - "),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Text(
                          "₹${cardModel[index].totalAmount == 0 ? cardModel[index].sellingPrice : cardModel[index].totalAmount}",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class QuantitySelector extends StatefulWidget {
  CartModel cartModel;
  Function reffress;

  QuantitySelector({this.cartModel, this.reffress});

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  double qty = 0.0;
  double def = 1.0;
  int quantityPack = 1;
  String unit = "kg";

  @override
  void initState() {
    unit = widget.cartModel.unit;
    qty = widget.cartModel.quantity;
    if (widget.cartModel.unit == "g") {
      def = 50;
    }
    if (widget.cartModel.sellingType == "Pack") {
      quantityPack = 1;
    }
    super.initState();
  }

  calculatePriceForWeight() {
    if (unit == widget.cartModel.unit) {
      widget.cartModel.totalAmount = qty *
          widget.cartModel.sellingPrice /
          widget.cartModel.quantityAsPrice;
      widget.cartModel.quantity = qty;
      widget.cartModel.tempUnit = unit;
    } else {
      print("def");
      double factor = TempDatabase.factor[widget.cartModel.unit + '-' + unit];
      widget.cartModel.totalAmount = factor *
          widget.cartModel.sellingPrice *
          qty /
          widget.cartModel.quantityAsPrice;
      widget.cartModel.quantity = qty;
      widget.cartModel.tempUnit = unit;
    }
    widget.cartModel.totalAmount = widget.cartModel.totalAmount.roundToDouble();
    widget.reffress();
  }

  calculatePriceForPacket() {
    widget.cartModel.totalAmount = quantityPack * widget.cartModel.sellingPrice;
    widget.reffress();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    if (widget.cartModel.sellingType == "Weight")
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("Quantity : -",style: TextStyle(color: Colors.black,fontSize: 18),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text("Quantity :-"),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            if (qty > 0)
                              setState(() {
                                qty = qty - def;
                                widget.cartModel.quantity = qty;
                                calculatePriceForWeight();
                              });
                          }),
                      Text(widget.cartModel.quantity.toString()),
                      IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              qty = qty + def;
                              widget.cartModel.quantity = qty;
                              calculatePriceForWeight();
                            });
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.02,
                ),

                SizedBox(
                  width: width * 0.3,
                  height: size.height * 0.07,
                  child: DropdownButtonFormField(
                    hint: Text("Category"),
                    decoration: CommonAssets.de,
                    value: widget.cartModel.unit,
                    validator: (val) => val == null ? "Select unit" : null,
                    onChanged: (val) {
                      unit = val;
                      if (val == 'g') {
                        widget.cartModel.quantity = 100;
                        def = 50;
                        if (widget.cartModel.unit == "g") {
                          qty = widget.cartModel.quantityAsPrice.toDouble();
                        }

                        // calculatePriceForWeight();
                        setState(() {});
                      } else {
                        qty = 1;
                        def = 0.5;
                        if (widget.cartModel.unit == "kg") {
                          qty = widget.cartModel.quantityAsPrice.toDouble();
                        }
                        // calculatePriceForWeight();
                        setState(() {});
                      }
                      widget.cartModel.tempUnit = val;
                    },

                    ///TODO : attach category
                    items: TempDatabase.unitType[widget.cartModel.sellingType]
                        .map((e) => DropdownMenuItem<String>(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                  ),
                ),
                // Expanded(child: Container()),
              ],
            ),
            SizedBox(
              height: width * 0.02,
            ),
          ],
        ),
      );
    if (widget.cartModel.sellingType == "Pack")
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text("Quantity :-"),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Theme.of(context).primaryColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      if (quantityPack > 0)
                        setState(() {
                          quantityPack = quantityPack - 1;
                          widget.cartModel.quantity = quantityPack.toDouble();
                          calculatePriceForPacket();
                        });
                    }),
                Text(widget.cartModel.quantity.toString()),
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        quantityPack = quantityPack + 1;
                        widget.cartModel.quantity = quantityPack.toDouble();
                        calculatePriceForPacket();
                      });
                    }),
              ],
            ),
          ),
          SizedBox(
            width: width * 0.02,
          ),

          Text("Packet"),
          SizedBox(
            width: width * 0.02,
          ),
          Text(
              "(${widget.cartModel.quantityAsPrice}  ${widget.cartModel.unit})"),
          // Expanded(child: Container()),
        ],
      );
    if (widget.cartModel.sellingType == "Piece")
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text("Quantity :-"),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Theme.of(context).primaryColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      if (quantityPack > 0)
                        setState(() {
                          quantityPack = quantityPack - 1;
                          widget.cartModel.quantity = quantityPack.toDouble();
                          calculatePriceForPacket();
                        });
                    }),
                Text(widget.cartModel.quantity.toString()),
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        quantityPack = quantityPack + 1;
                        widget.cartModel.quantity = quantityPack.toDouble();
                        calculatePriceForPacket();
                      });
                    }),
              ],
            ),
          ),
          SizedBox(
            width: width * 0.02,
          ),

          Text("Peace"),
          SizedBox(
            width: width * 0.02,
          ),
          // Text("(${widget.cartModel.quantityAsPrice}  ${widget.cartModel.unit})"),
          // Expanded(child: Container()),
        ],
      );
  }
}
