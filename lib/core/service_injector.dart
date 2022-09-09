import 'package:smarcra/core/services/service_export.dart';

class ServiceInjector{
  RouterService routerService = RouterService();
  DialogService dialogService = DialogService();
  AuthService authService = AuthService();
  TimeSheetService timeSheetService = TimeSheetService();
  LeaveService leaveService = LeaveService();
  ExpenseService expenseService = ExpenseService();
  UtilityService utilityService = UtilityService();
}

ServiceInjector si = ServiceInjector();