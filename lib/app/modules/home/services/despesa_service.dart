import 'package:despesas_pessoais/app/modules/home/repositories/despesa_repository_interface.dart';
import 'package:despesas_pessoais/app/modules/home/services/despesa_service_interface.dart';
import 'package:despesas_pessoais/app/modules/home/dtos/despesa_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DespesaService extends Disposable implements IDespesaService {
  final IDespesaRepository despesaRepository;

  DespesaService({required this.despesaRepository});

  Future<int> insert(DespesaDto despesa) async {
    return await despesaRepository.insert(despesa);
  }

  Future<List<DespesaDto>> queryAllRows() async {
    return await despesaRepository.queryAllRows();
  }

  Future<int> queryRowCount() async {
    return await despesaRepository.queryRowCount();
  }

  Future<int> update(DespesaDto despesa) async {
    return await despesaRepository.update(despesa);
  }

  Future<int> delete(int id) async {
    return await despesaRepository.delete(id);
  }

  Future<DespesaDto> findById(int id) async {
    return await despesaRepository.findById(id);
  }

  @override
  void dispose() {}
}
