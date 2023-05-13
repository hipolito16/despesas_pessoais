import 'package:despesas_pessoais/app/shared/components/adaptative_date_picker.dart';
import 'package:despesas_pessoais/app/shared/components/adaptative_text_field.dart';
import 'package:despesas_pessoais/app/shared/components/adaptative_button.dart';
import 'package:despesas_pessoais/app/modules/home/dtos/despesa_dto.dart';
import 'package:despesas_pessoais/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class DespesaForm extends StatefulWidget {
  const DespesaForm({Key? key}) : super(key: key);

  @override
  State<DespesaForm> createState() => _DespesaFormState();
}

class _DespesaFormState extends State<DespesaForm> {
  HomeController controller = Modular.get<HomeController>();
  final _descricaoController = TextEditingController();
  final _valorController = TextEditingController();
  final FocusNode _descricaoFocusNode = FocusNode();
  final FocusNode _valorFocusNode = FocusNode();
  DateTime? _selectedData = DateTime.now();

  _submitForm() {
    final descricao = _descricaoController.text;
    final valor = double.tryParse(_valorController.text) ?? 0;

    if (descricao.isEmpty || valor <= 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            title: const Text('Dados inválidos!'),
            content: const Text('Verifique os dados informados.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
      if (descricao.isEmpty) {
        return FocusScope.of(context).requestFocus(_descricaoFocusNode);
      } else if (valor <= 0) {
        return FocusScope.of(context).requestFocus(_valorFocusNode);
      }
    }
    DespesaDto dto = DespesaDto(
      descricao: descricao,
      valor: valor,
      data: _selectedData!,
    );
    controller.save(dto);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              AdaptativeTextField(
                label: 'Título',
                controller: _descricaoController,
                focusNode: _descricaoFocusNode,
                keyboardType: TextInputType.text,
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeTextField(
                label: 'Valor (R\$)',
                controller: _valorController,
                focusNode: _valorFocusNode,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedData!,
                onDateChanged: (newData) {
                  setState(() {
                    _selectedData = newData;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AdaptativeButton(
                    label: 'Nova Transação',
                    onPressed: _submitForm,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
