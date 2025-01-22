
import 'package:flutter_sample/constants/export.dart';

enum CreditCardType {
  master,
  visa,
  verve,
  discover,
  americanExpress,
  dinersClub,
  jcb,
  others,
}


class CardUtils{

  static CreditCardType getCardTypeFrmNumber(String input) {
    CreditCardType cardType;
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CreditCardType.master;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = CreditCardType.visa;
    } else if (input.startsWith(RegExp(r'((506(0|1))|(507(8|9))|(6500))'))) {
      cardType = CreditCardType.verve;
    } else if (input.startsWith(RegExp(r'((34)|(37))'))) {
      cardType = CreditCardType.americanExpress;
    } else if (input.startsWith(RegExp(r'((6[45])|(6011))'))) {
      cardType = CreditCardType.discover;
    } else if (input.startsWith(RegExp(r'((30[0-5])|(3[89])|(36)|(3095))'))) {
      cardType = CreditCardType.dinersClub;
    } else if (input.startsWith(RegExp(r'(352[89]|35[3-8][0-9])'))) {
      cardType = CreditCardType.jcb;
    } else {
      cardType = CreditCardType.others;
    }
    return cardType;
  }

  static String getCleanedNumber(String? text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text!.replaceAll(regExp, '');
  }

  static String getCardIcon(CreditCardType? cardType) {
    String img = "";
    switch (cardType) {
      case CreditCardType.master:
        img = AppAssets.imagesIcMastercard;
        break;
      case CreditCardType.visa:
        img = AppAssets.imagesIcVisa;
        break;
      case CreditCardType.verve:
        img = AppAssets.imagesIcVerve;
        break;
      case CreditCardType.americanExpress:
        img = AppAssets.imagesIcAmericanExpress;
        break;
      case CreditCardType.discover:
        img = AppAssets.imagesIcDiscover;
        break;
      case CreditCardType.dinersClub:
        img = AppAssets.imagesIcDinersClub;
        break;
      case CreditCardType.jcb:
        img = AppAssets.imagesIcJcb;
        break;
      case CreditCardType.others:
        img = AppAssets.imagesIcCreditCard;
        break;
      default:
        img = AppAssets.imagesIcCreditCard;
        break;
    }
    return img;
  }
  static String getCardName(CreditCardType? cardType) {
    String cardName = "";
    switch (cardType) {
      case CreditCardType.master:
        cardName = AppStrings.masterCard.tr;
        break;
      case CreditCardType.visa:
        cardName = AppStrings.visa.tr;
        break;
      case CreditCardType.verve:
        cardName = AppStrings.verve.tr;
        break;
      case CreditCardType.americanExpress:
        cardName = AppStrings.americanExpress.tr;
        break;
      case CreditCardType.discover:
        cardName = AppStrings.discover.tr;
        break;
      case CreditCardType.dinersClub:
        cardName = AppStrings.dinersClub.tr;
        break;
      case CreditCardType.jcb:
        cardName = AppStrings.jcb.tr;
        break;
      case CreditCardType.others:
        cardName = AppStrings.others.tr;
        break;
      default:
        cardName = AppStrings.others.tr;
        break;
    }
    return cardName;
  }

  static String? validateCardNum(String? input) {
    if (input == null || input.isEmpty) {
      return AppStrings.cardNumberEmpty.tr;
    }
    input = getCleanedNumber(input);
    if (input.length < 8) {
      return AppStrings.cardNumberIsInvalid.tr;
    }
    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(input[length - i - 1]);
// every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }
    if (sum % 10 == 0) {
      return null;
    }
    return AppStrings.cardNumberIsInvalid.tr;
  }


  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }
  static bool hasDateExpired(int month, int year) {
    return isNotExpired(year, month);
  }
  static bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }
  static List<int> getExpiryDate(String value) {
    var split = value.split(RegExp(r'(/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }
  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is more than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }
  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently is more than card's
    // year
    return fourDigitsYear < now.year;
  }
  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.cvvEmpty.tr;
    }
    if (value.length < 3 || value.length > 4) {
      return AppStrings.cvvIsInvalid.tr;
    }
    return null;
  }
  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.expiryDateEmpty.tr;
    }
    int year;
    int month;
    if (value.contains(RegExp(r'(/)'))) {
      var split = value.split(RegExp(r'(/)'));

      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {

      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }
    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return AppStrings.expiryMonthIsInvalid.tr;
    }
    var fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      // We are assuming a valid should be between 1 and 2099.
      // Note that, it's valid doesn't mean that it has not expired.
      return AppStrings.expiryYearIsInvalid.tr;
    }
    if (!hasDateExpired(month, year)) {
      return AppStrings.cardHasExpired.tr;
    }
    return null;
  }

}


class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(' '); // Add double spaces.
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }

}