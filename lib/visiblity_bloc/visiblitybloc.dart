import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practise_for_av/bloc/counter_event.dart';
import 'package:flutter_practise_for_av/bloc/counter_state.dart';
import 'package:flutter_practise_for_av/visiblity_bloc/visibility_state.dart';
import 'package:flutter_practise_for_av/visiblity_bloc/visiblity_event.dart';

class Visiblitybloc extends Bloc<VisiblityEvent, VisibilityState>{


  Visiblitybloc() : super(VisibilityState(type: true)){
    on<VisiblityShowEvent>(
            (event,emit)=>emit(VisibilityState(type: true)));
    on<VisiblityHideEvent>(
            (event,emit)=>emit(VisibilityState(type: false)));
  }
}