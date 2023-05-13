import 'package:despesas_pessoais/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DespesaList extends StatefulWidget {
  const DespesaList({Key? key}) : super(key: key);

  @override
  State<DespesaList> createState() => _DespesaListState();
}

class _DespesaListState extends State<DespesaList> {
  HomeController controller = Modular.get<HomeController>();

  _onPressedRemove(int id) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        title: const Text('Excluir Transação'),
        content: const Text('Tem certeza?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Não'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Sim'),
          ),
        ],
      ),
    ).then((confirmed) {
      if (confirmed) {
        controller.delete(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (controller.loadingList) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: (ctx, index) {
              final tr = controller.list[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            'R\$${tr.valor}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.descricao as String,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat('dd/MM/yyyy').format(tr.data as DateTime),
                    ),
                    trailing: MediaQuery.of(context).size.width > 480
                        ? TextButton.icon(
                            onPressed: () => _onPressedRemove(tr.id!),
                            icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
                            label: Text(
                              'Excluir',
                              style: TextStyle(color: Theme.of(context).colorScheme.error),
                            ),
                          )
                        : IconButton(
                            icon: const Icon(Icons.delete),
                            color: Theme.of(context).colorScheme.error,
                            onPressed: () => _onPressedRemove(tr.id!),
                          )),
              );
            },
          );
        }
      },
    );
  }
}
