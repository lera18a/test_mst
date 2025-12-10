import 'package:flutter/material.dart';
import 'package:test_mst/global_page/global_page.dart';
import 'package:test_mst/shared_preferences/shared_preferences_service.dart';

class PaywallItem extends StatefulWidget {
  const PaywallItem({
    super.key,
    required this.text,
    required this.benefits,
    required this.price,
    this.percentSale,
    required this.yearSubscribe,
  });
  final String text;
  final List<Widget> benefits;
  final double price;
  final double? percentSale;
  final bool yearSubscribe;
  @override
  State<PaywallItem> createState() => _PaywallItemState();

  static double newPriceFunction({
    required double price,
    required double percent,
  }) {
    final sale = price * (percent / 100);
    final newPrice = price - sale;
    return newPrice;
  }
}

enum PaymentState { initial, processing, payed }

class _PaywallItemState extends State<PaywallItem> {
  PaymentState _paymentState = PaymentState.initial;

  @override
  Widget build(BuildContext context) {
    final sale = widget.percentSale != null;
    final double? newPrice = sale
        ? PaywallItem.newPriceFunction(
            percent: widget.percentSale!,
            price: widget.price,
          )
        : null;
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: .min,
            children: [
              Text(
                widget.text,
                textAlign: .center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),

              Center(
                child: Row(
                  mainAxisAlignment: .spaceEvenly,

                  children: [
                    Text(
                      '${widget.price}\$',
                      textAlign: .center,
                      style: TextStyle(
                        decoration: widget.yearSubscribe == true
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontSize: 14,
                        fontWeight: widget.yearSubscribe == true
                            ? FontWeight.w300
                            : FontWeight.w500,
                      ),
                    ),
                    if (newPrice != null)
                      Text(
                        '${newPrice.toStringAsFixed(1)}\$',
                        textAlign: .center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ...widget.benefits,
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                child: _paymentState == .initial
                    ? OutlinedButton(
                        style: ButtonStyle(
                          padding: WidgetStatePropertyAll(
                            EdgeInsetsGeometry.symmetric(horizontal: 10),
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            _paymentState = .processing;
                          });
                          await Future.delayed(Duration(seconds: 2));
                          await SharedPreferencesService.setSubscribed(true);
                          setState(() {
                            _paymentState = .payed;
                          });
                          if (!mounted) return;
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => GlobalPage(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Center(
                          child: Text(
                            'Продолжить',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )
                    : _paymentState == PaymentState.processing
                    ? OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            SizedBox(
                              height: 9,
                              width: 9,
                              child: CircularProgressIndicator(),
                            ),
                            SizedBox(width: 15),
                            Text(
                              'В обработке',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      )
                    : ElevatedButton(
                        onPressed: null,
                        child: Center(
                          child: Text(
                            'Оплачено',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
