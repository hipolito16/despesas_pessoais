import 'package:despesas_pessoais/app/modules/home/dtos/despesa_dto.dart';
import 'package:despesas_pessoais/app/modules/home/repositories/despesa_repository_interface.dart';
import 'package:despesas_pessoais/app/modules/home/services/despesa_service_interface.dart';
import 'package:despesas_pessoais/app/modules/home/repositories/despesa_repository.dart';
import 'package:despesas_pessoais/app/modules/home/services/despesa_service.dart';
import 'package:despesas_pessoais/app/modules/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        /// Repositories
        Bind<IDespesaRepository>((i) => DespesaRepository()),

        /// Services
        Bind<IDespesaService>((i) => DespesaService(despesaRepository: i.get())),

        /// Controllers
        Bind((i) => HomeController(despesaService: i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
      ];
}
