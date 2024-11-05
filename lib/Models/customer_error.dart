// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CustomerError extends Equatable {
  final  String errMsg;
  CustomerError({
    this.errMsg = '',
});

  @override
  // TODO: implement props
  List<Object?> get props => [errMsg];

  @override
  bool get stringify => true;
}
