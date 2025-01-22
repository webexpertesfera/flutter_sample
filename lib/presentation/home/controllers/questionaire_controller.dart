import 'dart:convert';

import 'package:flutter_sample/constants/export.dart';

class QuestionaireController extends GetxController {
  RxList<QuestionDataModel> questionsList = <QuestionDataModel>[].obs;
  RxList<QuestionDataModel> allQuestionsList = <QuestionDataModel>[].obs;
  List<ResponseSendModel> responseList = [];
  RxInt index = 0.obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    getQuestionnaireListAPICall();
    super.onReady();
  }

  getQuestionnaireListAPICall() async {
    isLoading.value = true;
    customLoader.show(Get.overlayContext!);

    await APIRepository.questionnaireListAPICall().then(
      (value) {
        isLoading.value = false;
        customLoader.hide();
        if (value != null) {
          QuestionnaireResponseModel questionnaireResponseModel = value;
          allQuestionsList.value = questionnaireResponseModel.data?.questions ?? [];
          allQuestionsList.refresh();
          addQuestion();
        }
      },
    ).onError(
      (error, stackTrace) {
        isLoading.value = false;
        customLoader.hide();
        showErrorSnackBar(error.toString());
      },
    );
  }

  addQuestion() {
    debugPrint("index===== " + index.value.toString());
    debugPrint(allQuestionsList.length.toString());
    if (index.value < allQuestionsList.length) {
      questionsList.insert(0, allQuestionsList[index.value]);

      index.value++;
      index.refresh();
      questionsList.refresh();
    }
  }

  addToResponseList({required QuestionDataModel? questionDataModel}) {
    var responseSendModel = ResponseSendModel(
      //TODO: Change isCategory
      isCategory: questionDataModel?.isCategory,
      answer: questionDataModel?.answer
          ?.map(
            (e) => e.answer,
          )
          .join(","),
      question: questionDataModel?.question,
      id: questionDataModel?.answer
          ?.map(
            (e) => e.id,
          )
          .toList(),
    );
    debugPrint(responseSendModel.toJson().toString());
    responseList.add(responseSendModel);
    debugPrint("responseList.length ${responseList.length}");
    addQuestion();
  }

  nextAndSubmitButtonPress() {
    var index = 0;
    if (responseList.length == allQuestionsList.length) {
      _submitDialog();
    } else {
      //To Ensure questionsList[index].answer is initialized before adding data
      questionsList[index].answer ??= [];
      //Adding Data in Multi Choice Question
      if (questionsList[index].choiceQuesType == typeMultiCheck) {
        var selectedOptionList = questionsList[index].getAnswer!.where((element) => element.isSelected == true).toList();
        if (questionsList[index].isRequired == keyTrue && selectedOptionList.isEmpty) {
          showErrorSnackBar(AppStrings.pleaseSelectAnOption.tr);
        } else {
          if (selectedOptionList.isEmpty) {
            questionsList[index].answer = [];
          } else {
            questionsList[index].answer = selectedOptionList;
          }

          addToResponseList(questionDataModel: questionsList[index]);
        }

        //Here we add all the elements of "getAnswer" List where "isSelected" is True
      } else {
        //Adding Data in Single Choice Question
        //Here we check if our question is required and value is null we show Message
        if (questionsList[index].isRequired == keyTrue && questionsList[index].selectedOption == null) {
          showErrorSnackBar(AppStrings.pleaseSelectAnOption.tr);
          questionsList[index].answer = [];
        } else {
          //Here we add selectedOption in answer
          if (questionsList[index].selectedOption != null) {
            questionsList[index].answer?.add(questionsList[index].selectedOption!);
          } else {
            questionsList[index].answer = null;
          }
          addToResponseList(questionDataModel: questionsList[index]);
        }
      }
      if (responseList.length == allQuestionsList.length) {
        debugPrint(jsonEncode(responseList));
        Future.delayed(
          Duration(milliseconds: 100),
          () {
            _submitDialog();
          },
        );
      }
      questionsList.refresh();
    }
  }

  _submitDialog() {
    Get.dialog(
      LogoutDialog(
        description: AppStrings.youWantToSubmitTheResponse.tr,
        title: AppStrings.areYouSure.tr,
        onYesPress: () {
          hitResponseSubmitAPI();
        },

      ),
    );
  }

  hitResponseSubmitAPI() async {
    Get.back(result: true);
    UserDataModel userDataModel = await PreferenceManger.getSavedLoginData();
    var data = RequestModel.responseSubmit(userId: userDataModel.id, response: jsonEncode(responseList));
    await APIRepository.responseSubmitAPICall(data: data).then(
      (value) async {
        if (value != null) {
          SuccessModel successModel = value;
          var result = await Get.toNamed(AppRoutes.cardsListScreen, arguments: {keyId: successModel.data, keyType: typePersonalized});
          if (result != null) {
            Get.back(result: true);
          }
        }
      },
    ).onError(
      (error, stackTrace) {
        showErrorSnackBar(error.toString());
      },
    );
  }
}
