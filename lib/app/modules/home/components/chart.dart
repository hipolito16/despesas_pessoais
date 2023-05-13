import 'package:despesas_pessoais/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'chart_bar.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: controller.groupedDespesa.map((tr) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: tr['day'] as String,
                  value: tr['value'] as double,
                  percentage: controller.WeekTotal == 0 ? 0 : (tr['value'] as double) / controller.WeekTotal,
                ),
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
