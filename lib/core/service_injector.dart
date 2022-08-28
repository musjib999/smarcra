import 'package:smarcra/core/services/service_export.dart';

class ServiceInjector{
  RouterService routerService = RouterService();
  DialogService dialogService = DialogService();
  AuthService authService = AuthService();
}

ServiceInjector si = ServiceInjector();