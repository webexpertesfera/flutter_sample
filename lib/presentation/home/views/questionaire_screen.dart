import 'dart:convert';

import 'package:flutter_sample/constants/export.dart';

class QuestionaireScreen extends GetView<QuestionaireController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: AppColors.searchTextFieldColor.withOpacity(0.24),
        title: AppStrings.personalisedQuestionnaire.tr,
        onBackPress: () {
          Get.back(result: true);
        },
      ),
      body: Obx(
        () => controller.questionsList.isEmpty && controller.isLoading.value==false
            ? noDataFound(text: AppStrings.noQuestionsFound.tr)
            : Column(
                children: [
                  _topView(),
                  _chatList(),

                  _nextAndSubmitButton(),
                ],
              ),
      ),
    );
  }

  _topView() {
    return Container(
      height: height_30,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: margin_25),
      decoration: BoxDecoration(
          color: AppColors.searchTextFieldColor.withOpacity(0.24),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(radius_25), bottomLeft: Radius.circular(radius_25))),
    );
  }

  _receivedMessageView(int index) {
    return IgnorePointer(
      ignoring: controller.responseList.length==controller.allQuestionsList.length &&  controller.questionsList[index].answer != null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: margin_25, vertical: margin_20),
            margin: EdgeInsets.only(right: margin_30),
            decoration: BoxDecoration(
                color: AppColors.receivedChatBgColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.circular(radius_20),
                    topLeft: Radius.circular(radius_20),
                    topRight: Radius.circular(radius_20))),
            child: Text(
              controller.questionsList[index].question ?? "",
              style: TextStyles.poppins12w500()?.copyWith(color: AppColors.chatTextColor),
            ),
          ),
          controller.questionsList[index].choiceQuesType == typeMultiCheck
              ? _multiCheckOptions(index)
              : controller.questionsList[index].choiceQuesType == typeSingleCheck
                  ? _singleCheckOptions(index)
                  : Container(),
          controller.questionsList[index].answer != null &&  controller.questionsList[index].answer != []? _answerView(index) : Container(),
        ],
      ),
    );
  }

  _answerView(int index) {
    return Align(
      alignment: Alignment.centerRight,
      child: ListView.separated(
        shrinkWrap: true,padding: EdgeInsets.symmetric(vertical: margin_15),
        itemCount: (controller.questionsList[index].answer?.length ?? 0),
        itemBuilder: (context, answerIndex) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: margin_25, vertical: margin_20),
            margin: EdgeInsets.only(left: margin_30),
            decoration: BoxDecoration(
                color: AppColors.sentMessageBgColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.zero,
                    bottomLeft: Radius.circular(radius_20),
                    topLeft: Radius.circular(radius_20),
                    topRight: Radius.circular(radius_20))),
            child: Text(
              controller.questionsList[index].answer?[answerIndex].answer ?? "",
              style: TextStyles.poppins12w500()?.copyWith(color: Colors.white),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: height_10,
          );
        },
      ),
    );
  }

  _chatList() {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        reverse: true,
        padding: EdgeInsets.all(margin_15),
        itemCount: controller.questionsList.length,
        itemBuilder: (context, index) {
          return _receivedMessageView(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: height_30,
          );
        },
      ),
    );
  }

  //Not Used as of Now because Questions will be either single Choice or Multi Choice
  _sendMessageTextField() {
    return CustomTextField(
      fillColor: AppColors.chatTextFieldColor.withOpacity(0.2),
      hintText: AppStrings.enterMessage.tr,
      suffix: AssetImageWidget(
        imagePath: AppAssets.imagesIcSendButton,
        height: height_35,
        fit: BoxFit.contain,
        width: height_35,
      ).marginAll(margin_5),
    ).marginOnly(left: margin_20, right: margin_20);
  }

  _multiCheckOptions(int index) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: margin_15),
      itemCount: controller.questionsList[index].getAnswer?.length ?? 0,
      itemBuilder: (context, itemIndex) {
        return GetInkwell(
          onTap: () {
            controller.questionsList[index].getAnswer?[itemIndex].isSelected = !controller.questionsList[index].getAnswer![itemIndex].isSelected;
            controller.questionsList.refresh();
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: margin_10,
            ),
            decoration: BoxDecoration(color: AppColors.receivedChatBgColor, borderRadius: BorderRadius.circular(radius_50)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AssetImageWidget(
                  imagePath: controller.questionsList[index].getAnswer?[itemIndex].isSelected == true
                      ? AppAssets.imagesIcCheckSelected
                      : AppAssets.imagesIcCheckUnselected,
                  width: width_30,
                ).marginOnly(left: margin_15),
                Text(
                  controller.questionsList[index].getAnswer?[itemIndex].answer ?? "",
                  style: TextStyles.poppins12w500()?.copyWith(color: AppColors.chatTextColor),
                ).marginOnly(left: margin_10, right: margin_25)
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: height_15,
        );
      },
    );
  }



  _singleCheckOptions(int index) {
    return  Wrap(
      spacing: width_15,
      runSpacing: width_15,
      children: (controller.questionsList[index].getAnswer??[]).map(
        (element) {
          return GetInkwell(
            onTap: () {
              controller.questionsList[index].selectedOption = element;
              controller.questionsList.refresh();
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: margin_10,
              ),
              decoration: BoxDecoration(color: AppColors.receivedChatBgColor, borderRadius: BorderRadius.circular(radius_50)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AssetImageWidget(
                    imagePath: controller.questionsList[index].selectedOption == element
                        ? AppAssets.imagesIcRadioSelected
                        : AppAssets.imagesIcRadioUnselected,
                    width: width_30,
                  ).marginOnly(left: margin_15),
                  Text(
                    element.answer ?? "",
                    style: TextStyles.poppins12w500()?.copyWith(color: AppColors.chatTextColor),
                  ).marginOnly(left: margin_10, right: margin_25)
                ],
              ),
            ),
          );
        },
      ).toList(),
    ).marginOnly(top: margin_15);
  }

  _nextAndSubmitButton() {
    return CustomButton(
      onTap: () {
       controller.nextAndSubmitButtonPress();
      },
      title: controller.index.value == controller.allQuestionsList.length ? AppStrings.submit.tr : AppStrings.next.tr,
      width: Get.width,
    ).marginOnly(left: margin_15, right: margin_15, top: margin_10, bottom: margin_30);
  }
}
