import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:openai_recomendation_app/bloc/phone_recomendation/phone_recomendation_state.dart';
import 'package:openai_recomendation_app/models/api/openai_api.dart';
import 'package:openai_recomendation_app/models/gpt_response.dart';

class PhoneRecomendationCubit extends Cubit<PhoneRecomendationState> {
  PhoneRecomendationCubit() : super(PhoneRecomendationInitial());

  void getPhoneRecomendation({
    String? budget,
    String? camera,
    String? storage,
  }) async {
    try {
      emit(PhoneRecomendationLoading());
      final GptResponse response = await OpenAiApi().getPhoneRecomendation(
        budget: budget,
        camera: camera,
        storage: storage,
      );
      emit(PhoneRecomendationSuccess(
          result: response.choices![0].message!.content ?? ""));
    } catch (e) {
      emit(PhoneRecomendationSuccess(result: "Error"));
    }
  }
}
