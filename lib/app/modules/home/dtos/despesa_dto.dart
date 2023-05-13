class DespesaDto {
  int? id;
  String? descricao;
  double? valor;
  DateTime? data;

  DespesaDto({
    this.id,
    this.descricao,
    this.valor,
    this.data,
  });

  DespesaDto.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    descricao = map['descricao'];
    valor = map['valor'];
    data = DateTime.parse(map['data']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
      'valor': valor,
      'data': data?.toIso8601String(),
    };
  }
}
