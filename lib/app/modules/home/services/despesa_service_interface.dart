import 'package:despesas_pessoais/app/modules/home/dtos/despesa_dto.dart';

abstract class IDespesaService {
  Future<int> insert(DespesaDto despesa);

  Future<List<DespesaDto>> queryAllRows();

  Future<int> queryRowCount();

  Future<int> update(DespesaDto despesa);

  Future<int> delete(int id);

  Future<DespesaDto> findById(int id);
}
