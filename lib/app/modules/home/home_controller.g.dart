// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$loadingListAtom =
      Atom(name: '_HomeControllerBase.loadingList', context: context);

  @override
  bool get loadingList {
    _$loadingListAtom.reportRead();
    return super.loadingList;
  }

  @override
  set loadingList(bool value) {
    _$loadingListAtom.reportWrite(value, super.loadingList, () {
      super.loadingList = value;
    });
  }

  late final _$loadingChartAtom =
      Atom(name: '_HomeControllerBase.loadingChart', context: context);

  @override
  bool get loadingChart {
    _$loadingChartAtom.reportRead();
    return super.loadingChart;
  }

  @override
  set loadingChart(bool value) {
    _$loadingChartAtom.reportWrite(value, super.loadingChart, () {
      super.loadingChart = value;
    });
  }

  late final _$listAtom =
      Atom(name: '_HomeControllerBase.list', context: context);

  @override
  List<DespesaDto> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<DespesaDto> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$recentDespesaAtom =
      Atom(name: '_HomeControllerBase.recentDespesa', context: context);

  @override
  List<DespesaDto> get recentDespesa {
    _$recentDespesaAtom.reportRead();
    return super.recentDespesa;
  }

  @override
  set recentDespesa(List<DespesaDto> value) {
    _$recentDespesaAtom.reportWrite(value, super.recentDespesa, () {
      super.recentDespesa = value;
    });
  }

  late final _$groupedDespesaAtom =
      Atom(name: '_HomeControllerBase.groupedDespesa', context: context);

  @override
  List<Map<String, Object>> get groupedDespesa {
    _$groupedDespesaAtom.reportRead();
    return super.groupedDespesa;
  }

  @override
  set groupedDespesa(List<Map<String, Object>> value) {
    _$groupedDespesaAtom.reportWrite(value, super.groupedDespesa, () {
      super.groupedDespesa = value;
    });
  }

  late final _$WeekTotalAtom =
      Atom(name: '_HomeControllerBase.WeekTotal', context: context);

  @override
  double get WeekTotal {
    _$WeekTotalAtom.reportRead();
    return super.WeekTotal;
  }

  @override
  set WeekTotal(double value) {
    _$WeekTotalAtom.reportWrite(value, super.WeekTotal, () {
      super.WeekTotal = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_HomeControllerBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$getListAsyncAction =
      AsyncAction('_HomeControllerBase.getList', context: context);

  @override
  Future<void> getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }

  late final _$saveAsyncAction =
      AsyncAction('_HomeControllerBase.save', context: context);

  @override
  Future save(DespesaDto despesa) {
    return _$saveAsyncAction.run(() => super.save(despesa));
  }

  late final _$updateAsyncAction =
      AsyncAction('_HomeControllerBase.update', context: context);

  @override
  Future update(DespesaDto despesa) {
    return _$updateAsyncAction.run(() => super.update(despesa));
  }

  late final _$deleteAsyncAction =
      AsyncAction('_HomeControllerBase.delete', context: context);

  @override
  Future delete(int id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  late final _$getRecentDespesaAsyncAction =
      AsyncAction('_HomeControllerBase.getRecentDespesa', context: context);

  @override
  Future<void> getRecentDespesa() {
    return _$getRecentDespesaAsyncAction.run(() => super.getRecentDespesa());
  }

  late final _$getGroupedDespesaAsyncAction =
      AsyncAction('_HomeControllerBase.getGroupedDespesa', context: context);

  @override
  Future<void> getGroupedDespesa() {
    return _$getGroupedDespesaAsyncAction.run(() => super.getGroupedDespesa());
  }

  late final _$getWeekTotalAsyncAction =
      AsyncAction('_HomeControllerBase.getWeekTotal', context: context);

  @override
  Future<void> getWeekTotal() {
    return _$getWeekTotalAsyncAction.run(() => super.getWeekTotal());
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  void setLoadingList(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setLoadingList');
    try {
      return super.setLoadingList(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingChart(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setLoadingChart');
    try {
      return super.setLoadingChart(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loadingList: ${loadingList},
loadingChart: ${loadingChart},
list: ${list},
recentDespesa: ${recentDespesa},
groupedDespesa: ${groupedDespesa},
WeekTotal: ${WeekTotal}
    ''';
  }
}
