import 'package:despesas_pessoais/app/modules/home/components/despesa_form.dart';
import 'package:despesas_pessoais/app/modules/home/components/despesa_list.dart';
import 'package:despesas_pessoais/app/modules/home/components/chart.dart';
import 'package:despesas_pessoais/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Modular.get<HomeController>();
  bool _showChart = false;

  _openDespesasFormModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return const DespesaForm();
      },
    );
  }

  Widget _getIconButton(IconData icon, Function() fn) {
    return Platform.isIOS ? GestureDetector(onTap: fn, child: Icon(icon)) : IconButton(icon: Icon(icon), onPressed: fn);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availableHeight = mediaQuery.size.height - AppBar().preferredSize.height - mediaQuery.padding.top;
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final iconList = Platform.isIOS ? CupertinoIcons.refresh : Icons.list;
    final chartList = Platform.isIOS ? CupertinoIcons.refresh : Icons.show_chart;

    final actions = [
      if (isLandscape)
        _getIconButton(
          _showChart ? iconList : chartList,
          () {
            setState(() {
              _showChart = !_showChart;
            });
          },
        ),
      _getIconButton(
        Platform.isIOS ? CupertinoIcons.add : Icons.add,
        () => _openDespesasFormModal(context),
      ),
    ];

    final PreferredSizeWidget appBar = AppBar(
      title: const Text('Despesas Pessoais'),
      actions: actions,
    );

    final bodyPage = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_showChart || !isLandscape) SizedBox(height: availableHeight * (isLandscape ? 0.8 : 0.3), child: const Chart()),
            if (!_showChart || !isLandscape)
              SizedBox(
                height: availableHeight * (isLandscape ? 1 : 0.7),
                child: const DespesaList(),
              ),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: const Text('Despesas Pessoais'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: actions,
              ),
            ),
            child: bodyPage,
          )
        : Scaffold(
            appBar: appBar,
            body: bodyPage,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () => _openDespesasFormModal(context),
                  ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          );
  }
}
