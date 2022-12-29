import 'package:bloc/bloc.dart';
import 'package:pscct/blocs/procurement_bloc/procurement_states.dart';
import 'package:pscct/models/enums/pscct_categories.dart';
import 'package:pscct/repositories/procurement_repository.dart';

class ProcurementCubit extends Cubit<ProcurementState> {
  ProcurementCubit() : super(const Uninitialized());
  final ProcurementRepository _procurementRepository = ProcurementRepository();
  getReports() {
    _procurementRepository.getReports(category: PSCCTCategories.PR);
  }

  getAlerts() {
    _procurementRepository.getAlerts(category: PSCCTCategories.PR);
  }

  @override
  void onChange(Change<ProcurementState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
