/* ======================= Packages ======================= */
export 'package:get/get.dart' hide Response, HeaderValue, MultipartFile, FormData;
export 'package:flutter/material.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:intl/intl.dart' hide TextDirection;
export 'package:flutter/services.dart';
export 'package:in_app_purchase/in_app_purchase.dart';
export 'dart:async';
export 'package:flutter/rendering.dart';
export 'package:flutter_sample/data/local/dummy_lists.dart';

export 'dart:math';
export 'package:video_thumbnail/video_thumbnail.dart';
/* ======================= Utils ======================= */
export 'package:video_player/video_player.dart';



export 'package:audioplayers/audioplayers.dart';
export 'package:flutter_xlider/flutter_xlider.dart';
export 'package:flutter_sample/routes/app_routes.dart';
export 'package:flutter_sample/widgets/dialog_views/logout_dialog.dart';
export 'package:super_tooltip/super_tooltip.dart';
export 'package:dotted_line/dotted_line.dart';
export 'package:flutter_rating_bar/flutter_rating_bar.dart';
export 'package:flutter_sample/utils/helper_widgets.dart';
export 'package:firebase_messaging/firebase_messaging.dart';
export 'package:flutter_sample/utils/card_utils.dart';
export 'package:flutter_local_notifications/flutter_local_notifications.dart';
export 'package:firebase_core/firebase_core.dart';

export 'package:scratcher/scratcher.dart';
export 'package:smooth_page_indicator/smooth_page_indicator.dart';
export 'package:flutter_sample/services/push_notifications/push_notification_manager.dart';
export 'package:flutter/foundation.dart';
export 'package:flutter_sample/constants/app_colors.dart';
export 'package:flutter_animate/flutter_animate.dart' hide ScaleEffect,SlideEffect,SwapEffect;
export 'package:flutter_sample/routes/app_pages.dart';
export 'package:flutter_sample/services/dio_client.dart';
export 'package:dio/dio.dart';
export 'package:flutter_sample/widgets/custom_loader.dart';
export 'package:flutter_sample/widgets/file_image_widget.dart';
export 'package:image_cropper/image_cropper.dart';
export 'package:image_picker/image_picker.dart';
export 'package:flutter_sample/services/socket_client/sockets.dart';
export 'package:flutter_sample/services/endpoints.dart';
export 'package:flutter_sample/widgets/bottom_sheets/image_picker_sheet.dart';
export 'package:flutter_sample/services/network_exception.dart';
export 'package:flutter_sample/theme/theme_data.dart';
export 'package:flutter_sample/widgets/custom_button.dart';
export 'package:flutter_sample/constants/app_strings.dart';
export 'package:flutter_sample/constants/dimens.dart';
export 'package:get_storage/get_storage.dart';
export 'package:flutter_sample/data/local/preference_manager.dart';
export 'package:flutter_sample/widgets/network_image_widget.dart';
export 'package:flutter_sample/widgets/getInkwell.dart';
export 'package:pinput/pinput.dart';
export 'package:flutter_sample/widgets/asset_image_widget.dart';
export 'package:flutter_sample/logger/logger.dart';
export 'package:flutter_sample/theme/text_styles.dart';
export 'package:flutter_sample/utils/validator.dart';
export 'package:flutter/gestures.dart';
export 'package:flutter_sample/presentation/home/widgets/custom_app_bar.dart';

export 'package:flutter_sample/constants/app_assets.dart';
export 'package:flutter_sample/constants/route_arguments.dart';
export 'package:flutter_sample/widgets/custom_text_field.dart';
export 'package:flutter_sample/main.dart';
export 'package:flutter_sample/services/dio_logger.dart';
export 'package:country_code_picker/country_code_picker.dart';
export 'package:flutter_sample/services/api_repository.dart';
export 'package:flutter_sample/services/socket_client/socketConsts.dart';
/* ======================= Bindings ======================= */
export 'package:flutter_sample/presentation/authentication/binding/authentication_binding.dart';
export 'package:flutter_sample/presentation/home/bindings/home_binding.dart';
export 'package:flutter_sample/presentation/splash/binding/splash_binding.dart';





/* ======================= Controllers ======================= */
export 'package:flutter_sample/presentation/splash/controllers/splash_controller.dart';

export 'package:flutter_sample/presentation/home/controllers/personalised_cards_controller.dart';
export 'package:flutter_sample/presentation/home/controllers/main_controller.dart';
export 'package:flutter_sample/presentation/home/controllers/home_controller.dart';
export 'package:flutter_sample/presentation/authentication/controllers/signup_controller.dart';
export 'package:flutter_sample/presentation/authentication/controllers/login_controller.dart';
export 'package:flutter_sample/presentation/authentication/controllers/forgot_password_controller.dart';
export 'package:flutter_sample/presentation/authentication/controllers/otp_verification_controller.dart';
export 'package:flutter_sample/presentation/authentication/controllers/change_password_controller.dart';
export 'package:flutter_sample/presentation/home/controllers/categories_controller.dart';
export 'package:flutter_sample/presentation/home/controllers/questionaire_controller.dart';

export 'package:flutter_sample/presentation/home/controllers/notification_controller.dart';
/* ======================= Screens ======================= */
export 'package:flutter_sample/presentation/splash/views/splash_screen.dart';
export 'package:flutter_sample/presentation/home/views/notifications_screen.dart';
export 'package:flutter_sample/presentation/home/views/questionaire_screen.dart';
export 'package:flutter_sample/presentation/home/views/home_screen.dart';
export 'package:flutter_sample/presentation/home/widgets/create_personalised_cards_view.dart';
export 'package:flutter_sample/presentation/home/views/personalised_cards_screen.dart';
export 'package:flutter_sample/presentation/home/widgets/common_card_view.dart';
export 'package:flutter_sample/presentation/home/views/categories_screen.dart';
export 'package:flutter_sample/presentation/authentication/views/login_screen.dart';
export 'package:flutter_sample/presentation/authentication/views/change_password_screen.dart';
export 'package:flutter_sample/presentation/home/views/main_screen.dart';
export 'package:flutter_sample/presentation/home/widgets/custom_drawer.dart';
export 'package:flutter_sample/presentation/authentication/views/forgot_password_screen.dart';
export 'package:flutter_sample/presentation/authentication/views/signup_screen.dart';
export 'package:flutter_sample/presentation/authentication/views/otp_verification_screen.dart';


/* ======================= Translations ======================= */

export 'package:flutter_sample/localization/translation_service.dart';
export 'package:flutter_sample/localization/en_us.dart';
export 'package:flutter_sample/localization/he_il.dart';


/* ======================= Models ======================= */
export 'package:flutter_sample/models/data_model/success_model.dart';
export 'package:flutter_sample/models/data_model/user_data_model.dart';
export 'package:flutter_sample/models/request_model/request_model.dart';
export 'package:flutter_sample/models/response_model/login_response_model.dart';
export 'package:flutter_sample/models/data_model/faq_data_model.dart';
export 'package:flutter_sample/models/data_model/categories_data_model.dart';
export 'package:flutter_sample/models/response_model/categories_response_model.dart';
export 'package:flutter_sample/models/response_model/cards_list_response_model.dart';
export 'package:flutter_sample/models/data_model/cards_data_model.dart';

export 'package:flutter_sample/models/data_model/home_data_model.dart';
export 'package:flutter_sample/models/data_model/orders_data_model.dart';
export 'package:flutter_sample/models/response_model/home_response_model.dart';
export 'package:flutter_sample/models/response_model/order_detail_response_model.dart';
export 'package:flutter_sample/models/data_model/static_pages_data_model.dart';
export 'package:flutter_sample/models/response_model/static_pages_response_model.dart';
export 'package:flutter_sample/models/data_model/banner_data_model.dart';
export 'package:flutter_sample/models/response_model/faq_response_model.dart';
export 'package:flutter_sample/models/data_model/options_data_model.dart';
export 'package:flutter_sample/models/data_model/question_data_model.dart';
export 'package:flutter_sample/models/response_model/questionnaire_response_model.dart';
export 'package:flutter_sample/models/data_model/response_send_model.dart';

export 'package:flutter_sample/models/data_model/unpurchased_board_data_model.dart';
export 'package:flutter_sample/models/response_model/personalized_boards_response_model.dart';
export 'package:flutter_sample/models/data_model/transaction_list_data_model.dart';
export 'package:flutter_sample/models/response_model/transaction_list_response_model.dart';
export 'package:flutter_sample/models/data_model/tickets_list_data_model.dart';
export 'package:flutter_sample/models/response_model/tickets_list_response_model.dart';
export 'package:flutter_sample/models/data_model/chat_list_data_model.dart';
export 'package:flutter_sample/models/response_model/chat_list_response_model.dart';
export 'package:flutter_sample/models/response_model/send_message_response_model.dart';
export 'package:flutter_sample/models/data_model/notification_prefernce_data_model.dart';
export 'package:flutter_sample/models/response_model/notification_preference_response_model.dart';
export 'package:flutter_sample/models/response_model/notificcation_response_model.dart';
export 'package:flutter_sample/models/data_model/notification_data_model.dart';
export 'package:flutter_sample/models/response_model/paypal_response_model.dart';
export 'package:flutter_sample/models/data_model/plans_data_model.dart';
export 'package:flutter_sample/models/response_model/in_app_plans_list_model.dart';
export 'package:flutter_sample/models/data_model/binance_payment_data_model.dart';
export 'package:flutter_sample/models/response_model/binance_payment_response_model.dart';