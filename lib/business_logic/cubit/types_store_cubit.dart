import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'types_store_state.dart';

class TypesStoreCubit extends Cubit<TypesStoreState> {
  TypesStoreCubit() : super(TypesStoreInitial());
}
