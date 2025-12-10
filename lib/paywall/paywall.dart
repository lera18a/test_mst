import 'package:flutter/material.dart';
import 'package:test_mst/paywall/paywall_item.dart';
import 'package:test_mst/paywall/text_item.dart';

class Paywall extends StatelessWidget {
  const Paywall({super.key});

  @override
  Widget build(BuildContext context) {
    final newPrice = PaywallItem.newPriceFunction(price: 100, percent: 40);
    return Scaffold(
      appBar: AppBar(
        title: Text('Выбор подписки', style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: Stack(
          alignment: .center,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/gym.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withAlpha(200),
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black.withAlpha(200),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: .center,
              children: [
                PaywallItem(
                  text: 'Месячная подписка',
                  benefits: [
                    TextItem(text: 'Можно отменить в любой момент'),
                    TextItem(text: 'Удобно, чтобы попробовать зал'),
                    TextItem(text: 'Подходит, если не уверен в графике'),
                  ],
                  price: 5,
                  yearSubscribe: false,
                ),
                SizedBox(width: 15),

                PaywallItem(
                  text: 'Годовая подписка',
                  benefits: [
                    TextItem(text: 'До 40% дешевле в месяц, чем помесячно'),
                    TextItem(text: 'Фиксированная цена без подорожаний'),
                    TextItem(text: 'Бонус: бесплатный бассейн'),
                  ],
                  price: 100,
                  percentSale: newPrice,
                  yearSubscribe: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
