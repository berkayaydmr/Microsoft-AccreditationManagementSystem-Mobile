import 'dart:async';

import 'package:accreditation_management_system/repository/models/post_mip_request_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mip_event.dart';
part 'mip_state.dart';

class MipBloc extends Bloc<MipEvent, MipState> {
  MipBloc() : super(MipInitial()) {
    on<MipEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
