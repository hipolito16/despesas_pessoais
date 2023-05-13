import 'package:despesas_pessoais/app/modules/home/services/despesa_service_interface.dart';
import 'package:despesas_pessoais/app/modules/home/dtos/despesa_dto.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'dart:async';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IDespesaService despesaService;

  @observable
  bool loadingList = false;

  @observable
  bool loadingChart = false;

  @observable
  List<DespesaDto> list = [];

  @observable
  List<DespesaDto> recentDespesa = [];

  @observable
  List<Map<String, Object>> groupedDespesa = [];

  @observable
  double WeekTotal = 0.0;

  _HomeControllerBase({required this.despesaService}) {
    init();
  }

  @action
  Future<void> init() async {
    await getList();
    await getRecentDespesa();
    await getGroupedDespesa();
    await getWeekTotal();
  }

  @action
  void setLoadingList(bool value) => loadingList = value;

  @action
  void setLoadingChart(bool value) => loadingChart = value;

  @action
  Future<void> getList() async {
    setLoadingList(true);
    list = await despesaService.queryAllRows();
    setLoadingList(false);
  }

  @action
  save(DespesaDto despesa) async {
    setLoadingList(true);
    await despesaService.insert(despesa);
    init();
    setLoadingList(false);
  }

  @action
  update(DespesaDto despesa) async {
    setLoadingList(true);
    await despesaService.update(despesa);
    init();
    setLoadingList(false);
  }

  @action
  delete(int id) async {
    setLoadingList(true);
    await despesaService.delete(id);
    init();
    setLoadingList(false);
  }

  @action
  Future<void> getRecentDespesa() async {
    setLoadingChart(true);
    List<DespesaDto> step1 = list;
    List<DespesaDto> result = step1.where((tr) {
      return tr.data!.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
    recentDespesa = result;
    setLoadingChart(false);
  }

  @action
  Future<void> getGroupedDespesa() async {
    setLoadingChart(true);
    final step1 = recentDespesa;
    final result = List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < step1.length; i++) {
        bool sameDay = step1[i].data?.day == weekDay.day;
        bool sameMonth = step1[i].data?.month == weekDay.month;
        bool sameYear = step1[i].data?.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += step1[i].valor!;
        }
      }

      return {
        'day': DateFormat.E('pt_BR').format(weekDay)[0].toUpperCase(),
        'value': totalSum,
      };
    }).reversed.toList();
    groupedDespesa = result;
    setLoadingChart(false);
  }

  @action
  Future<void> getWeekTotal() async {
    setLoadingChart(true);
    final groupedDespesas = groupedDespesa;
    final result = groupedDespesas.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
    WeekTotal = result;
    setLoadingChart(false);
  }
}
