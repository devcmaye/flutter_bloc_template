import 'package:easy_localization/easy_localization.dart';

class AppStrings {
  // Normal Text
  static String get welcom_back => "hi_welcome_back".tr();
  static String get enter_password => "enter_password".tr();
  static String get enter_pin => "enter_pin".tr();
  static String get welcome_title1 => "welcome_title1".tr();
  static String get welcome_title2 => "welcome_title2".tr();
  static String get welcome_title3 => "welcome_title3".tr();
  static String get welcome_body1 => "welcome_body1".tr();
  static String get welcome_body2 => "welcome_body2".tr();
  static String get welcome_body3 => "welcome_body3".tr();

  static String get enter_phone_number => "enter_phone_number".tr();
  static String get do_not_have_account => "do_not_have_account".tr();
  static String get already_have_an_account => "already_have_an_account".tr();
  static String get otp_sent_successful => "otp_sent_successful".tr();
  static String get total_balance => "total_balance".tr();
  static String get to_scan_qr => "to_scan_qr".tr();
  static String get to_scan_qr_provided_by_payme =>
      "to_scan_qr_provided_by_payme".tr();
  static String get security_pin => "security_pin".tr();
  static String get please_enter_new_pin => "please_enter_new_pin".tr();
  static String get please_confirm_pin => "please_confirm_pin".tr();
  static String get create_pin => "create_pin".tr();
  static String send_otp_to_dse(String phone) =>
      "send_otp_to_dse".tr(namedArgs: {"phone": phone.tr()});

  static String get pension_no => "pension_no".tr();
  static String get proof_of_life_verification =>
      "proof_of_life_verification".tr();
  static String get withdrawable_pension_amount =>
      "withdrawable_pension_amount".tr();
  static String get cash_out_pension_salary => "cash_out_pension_salary".tr();
  static String get keep_going => "keep_going".tr();
  static String get amount_of_pension_to_withdraw =>
      "amount_of_pension_to_withdraw".tr();
  static String get mmk => "mmk".tr();
  static String get money_transfer_detail => "money_transfer_detail".tr();
  static String get type_of_money_transfer => "type_of_money_transfer".tr();
  static String get pensioner_information => "pensioner_information".tr();
  static String get amount => "amount".tr();
  static String get tax_amount => "tax_amount".tr();
  static String get label_total_amount => "label_total_amount".tr();
  static String get remark => "remark".tr();
  static String get confirmation => "confirmation".tr();
  static String get confirm_this_phone => "confirm_this_phone".tr();
  static String get six_digit_will_be_sent_to =>
      "six_digit_will_be_sent_to".tr();
  static String get cancel => "cancel".tr();
  static String get withdrawl_no => "withdrawl_no:".tr();
  static String get withdrawl_type => "withdrawl_type:".tr();
  static String get pension_no_colon => "pension_no:".tr();
  static String get total_amount => "total_amount".tr();
  static String get success => "success:".tr();
  static String get close => "close:".tr();
  static String get male => "male".tr();
  static String get female => "female".tr();
  static String get date_of_birth => "date_of_birth".tr();
  static String get do_not_code => "do_not_code".tr();
  static String get to_add_pensioner_nrc => "to_add_pensioner_nrc".tr();
  static String get to_add_pensioner_ppa => "to_add_pensioner_ppa".tr();

  static String get shop_owner_information => "shop_owner_information".tr();
  static String get shop_information => "shop_information".tr();
  static String get please_accept_terms_conditions =>
      "please_accept_terms_conditions".tr();
  static String get terms_and_condition_aggrement =>
      "terms_and_condition_aggrement".tr();
  static String get new_nrc => "new_nrc".tr();
  static String get old_nrc => "old_nrc".tr();
  static String get nrc_front_photo => "nrc_front_photo".tr();
  static String get nrc_back_photo => "nrc_back_photo".tr();
  static String get shop_owner_image => "shop_owner_image".tr();
  static String get shop_photo => "shop_photo".tr();
  static String get e_signature => "e_signature".tr();
  static String get register_no_otp_sent => 'register_no_otp_sent'.tr();
  static String get check_phone_number => 'check_phone_number'.tr();
  static String get terms_and_condition_text => "terms_and_condition_text".tr();
  static String get accept_terms_condition => "accept_terms_condition".tr();
  static String get terms_and_condition => "terms_and_condition".tr();
  static String get or => "or".tr();
  static String get search => "search".tr();
  static String get nrc_num => "nrc_num".tr();
  static String get phone_no => "phone_no".tr();
  static String get township => "township".tr();
  static String get address => "address".tr();
  static String get date_time => "date_time".tr();
  static String get wallet_account_number => "wallet_account_number".tr();
  static String get withdraw_cash_amount => "withdraw_cash_amount".tr();
  static String get wait_relative_department => "wait_relative_department".tr();
  static String get checking_your_information =>
      "checking_your_information".tr();
  static String get choose_operator => "choose_operator".tr();

  static String get top_up_phone_bill => "top_up_phone_bill".tr();
  static String get top_up_number => "top_up_number".tr();

  static String insert_phone_number_with_topup_type(String topUpType) =>
      "insert_phone_number_with_topup_type".tr(
        namedArgs: {"topupType": topUpType.tr()},
      );

  static String get insert_topup_amount => "insert_topup_amount".tr();
  static String get ycdc_department => "ycdc_department".tr();
  static String get ird_department => "ird_department".tr();
  static String get custom_department => "custom_department".tr();
  static String get ygn_electricity => "ygn_electricity".tr();
  static String get mdy_electricity => "mdy_electricity".tr();
  static String get npt_electricity => "npt_electricity".tr();
  static String get hi_internet => "hi_internet".tr();
  static String get ananda => "ananda".tr();
  static String get fivebb => "fivebb".tr();
  static String get wallet_uab_pay => "wallet_uab_pay".tr();
  static String get wallet_kbz_pay => "wallet_kbz_pay".tr();
  static String get wallet_aya_pay => "wallet_aya_pay".tr();
  static String get wallet_cb_pay => "wallet_cb_pay".tr();

  // AppBar
  static String get app_bar_payme => "app_bar_payme".tr();
  static String get app_bar_record_video => "app_bar_record_video".tr();
  static String get app_bar_preview_video => "app_bar_preview_video".tr();
  static String get app_bar_pension_withdrawal =>
      "app_bar_pension_withdrawal".tr();
  static String get app_bar_information_confirmation =>
      "app_bar_information_confirmation".tr();
  static String get app_bar_cash_request => "app_bar_cash_request".tr();
  static String get app_bar_pay_bill => "app_bar_pay_bill".tr();

  static String get app_bar_wallet_mobilt_banking =>
      "app_bar_wallet_mobilt_banking".tr();
  static String get app_bar_topup_phone_bills =>
      "app_bar_topup_phone_bills".tr();
  static String get app_bar_history => "app_bar_history".tr();
  static String get app_bar_verify_phone_number =>
      "app_bar_verify_phone_number".tr();
  static String get app_bar_personal_information =>
      "app_bar_personal_information".tr();
  static String get app_bar_update_personal_information =>
      "app_bar_update_personal_information".tr();
  static String get app_bar_terms_and_condition =>
      "app_bar_terms_and_condition".tr();
  static String get app_bar_married_status => "app_bar_married_status".tr();

  static String get app_bar_confirm_and_sign_agreement =>
      "app_bar_confirm_ans_sign_agreement".tr();
  static String get app_bar_create_pin => "app_bar_create_pin".tr();
  static String get app_bar_security_verification =>
      "app_bar_security_verification".tr();
  static String get app_bar_security_pin => "app_bar_security_pin".tr();
  static String get app_bar_setup_biometric => "app_bar_setup_biometric".tr();
  static String get app_bar_nrc_verification => "app_bar_nrc_verification".tr();
  static String get app_bar_transfer => "app_bar_transfer".tr();
  static String get app_bar_loyalty => "app_bar_loyalty".tr();
  static String get app_bar_tier_rewards_guide =>
      "app_bar_tier_rewards_guide".tr();
  static String get app_bar_my_rewards => "app_bar_my_rewards".tr();
  static String get app_bar_face_verification =>
      "app_bar_face_verification".tr();

  static String get app_bar_notification => "app_bar_notification".tr();
  static String get app_bar_profile => "app_bar_profile".tr();
  static String get app_bar_details => "app_bar_details".tr();
  static String get app_bar_transfer_details => "app_bar_transfer_details".tr();
  static String get app_bar_cashout => "app_bar_cashout".tr();
  static String get app_bar_cashout_details => "app_bar_cashout_details".tr();

  static String get app_bar_personal_details => "app_bar_personal_details".tr();
  static String get app_bar_pension_account => "app_bar_pension_account".tr();
  static String get app_bar_choose_language => "app_bar_choose_language".tr();
  static String get app_bar_privacy_policy => "app_bar_privacy_policy".tr();
  static String get app_bar_about_payme => "app_bar_about_payme".tr();
  static String get app_bar_change_pin => "app_bar_change_pin".tr();
  static String get app_bar_gov_pay_bill => "app_bar_gov_pay_bill".tr();
  static String get app_bar_electricity_bill => "app_bar_electricity_bill".tr();
  static String get app_bar_summary_review => "app_bar_summary_review".tr();
  static String get app_bar_internet_service => "app_bar_internet_service".tr();
  static String get app_bar_wallet_amount => "app_bar_wallet_amount".tr();
  static String get app_bar_pension_amount => "app_bar_pension_amount".tr();
  static String get app_bar_account_setting => "app_bar_account_setting".tr();
  static String get app_bar_delete_account => "app_bar_delete_account".tr();
  static String get app_bar_nearby => "app_bar_nearby".tr();

  //Sub Title
  static String get sub_title_verify_identity =>
      "sub_title_verify_identity".tr();

  //Normal Text
  static String get normal_text_scan_qr => "normal_text_scan_qr".tr();
  static String get normal_text_qr_code => "normal_text_qr_code".tr();
  static String get normat_text_accept => "normat_text_accept".tr();

  static String get normal_text_account_delete_1 =>
      "normal_text_account_delete_1".tr();
  static String get normal_text_account_delete_2 =>
      "normal_text_account_delete_2".tr();
  static String get normal_text_account_delete_3 =>
      "normal_text_account_delete_3".tr();
  static String get normal_text_account_delete_4 =>
      "normal_text_account_delete_4".tr();
  static String get normal_text_account_delete_5 =>
      "normal_text_account_delete_5".tr();
  static String get normal_text_payment_success =>
      "normal_text_payment_success".tr();
  static String get normal_text_sumitted_success =>
      "normal_text_sumitted_success".tr();

  //Label

  static String get label_sign_up => "label_sign_up".tr();
  static String get label_sign_up_one => "label_sign_up_one".tr();

  static String get label_login => "label_login".tr();
  static String get label_login_one => "label_login_one".tr();

  static String get label_home => "label_home".tr();
  static String get label_loyalty => "label_loyalty".tr();
  static String get label_more => "label_more".tr();
  static String get label_history => "label_history".tr();
  static String get label_profile => "label_profile".tr();
  static String get label_see_more => "label_see_more".tr();
  static String get label_mobile_ph_no => "label_mobile_ph_no".tr();

  static String get label_change_pin => "label_change_pin".tr();
  static String get label_language_selection => "label_language_selection".tr();
  static String get label_help_center => "label_help_center".tr();
  static String get label_logout => "label_logout".tr();
  static String get label_choose_language => "label_choose_language".tr();
  static String get label_about_payme => "label_about_payme".tr();
  static String get label_setup_biometric => "label_setup_biometric".tr();

  static String get label_setting => "label_setting".tr();
  static String get label_personal_details => "label_personal_details".tr();
  static String get label_privacy_policy => "label_privacy_policy".tr();
  static String get label_terms_and_conditions =>
      "label_terms_and_conditions".tr();
  static String get label_keep_pressing => "label_keep_pressing".tr();

  static String get label_device_info => "label_device_info".tr();
  static String get label_delete_account => "label_delete_account".tr();
  static String get label_pensioner_information =>
      "label_pensioner_information".tr();
  static String get label_nominee_information =>
      "label_nominee_information".tr();

  static String get label_please_enter_your_password =>
      "label_please_enter_your_password".tr();
  static String get label_bill_type => "label_bill_type".tr();
  static String get label_government_pay_bills =>
      "label_government_pay_bills".tr();
  static String get label_electricity_pay_bills =>
      "label_electricity_pay_bills".tr();
  static String get label_internet_service_pay_bills =>
      "label_internet_service_pay_bills".tr();
  static String get label_remember_me => "label_remember_me".tr();
  static String get label_in => "label_in".tr();
  static String get label_out => "label_out".tr();
  static String get label_all => "label_all".tr();
  static String get label_choose_wallet => "label_choose_wallet".tr();
  static String get label_transfer_amount => "label_transfer_amount".tr();
  static String get label_confirm_phone_and_pin =>
      "label_confirm_phone_and_pin".tr();
  static String label_enter_otp_code(String phoneNo) =>
      "label_enter_otp_code".tr(namedArgs: {"phoneNo": phoneNo.tr()});
  static String get label_do_not_receive_otp => "label_do_not_receive_otp".tr();

  static String get label_avoid_easy_pin => "label_avoid_easy_pin".tr();
  static String label_dse_number_otp_sent(String phoneNo) =>
      "label_dse_number_otp_sent".tr(namedArgs: {"phoneNo": phoneNo.tr()});
  static String get label_esignature => "label_esignature".tr();
  static String get label_shop_info => "label_shop_info".tr();
  static String get label_shop_front_photo => "label_shop_front_photo".tr();
  static String get label_shop_interior_photo =>
      "label_shop_interior_photo".tr();
  static String get label_enable_biometric => "label_enable_biometric".tr();

  static String get label_enable_biometric_security =>
      "label_enable_biometric_security".tr();

  static String get label_welcome_good_morning =>
      "label_welcome_good_morning".tr();
  static String get label_welcome_good_afternoon =>
      "label_welcome_good_afternoon".tr();
  static String get label_welcome_good_evening =>
      "label_welcome_good_evening".tr();
  static String get label_welcome_good_night => "label_welcome_good_night".tr();
  static String label_estimate_pay_day(String estimateDate) =>
      "label_estimate_pay_day".tr(
        namedArgs: {"estimateDate": estimateDate.tr()},
      );

  static String get label_face_verify => "label_face_verify".tr();

  static String get label_face_verify_success =>
      "label_face_verify_success".tr();

  static String get label_marital_status_verify =>
      "label_marital_status_verify".tr();
  static String get label_marital_status_already_verify =>
      "label_marital_status_already_verify".tr();
  static String get label_address => "label_address".tr();

  static String get label_township => "label_township".tr();
  static String get label_shop_name => "label_shop_name".tr();
  static String get label_city => "label_city".tr();
  static String get label_phone_number => "label_phone_number".tr();
  static String get label_father_name => "label_father_name".tr();
  static String get label_religion => "label_religion".tr();
  static String get label_nation => "label_nation".tr();
  static String get label_nrc_number => "label_nrc_number".tr();
  static String get label_old_pin => "label_old_pin".tr();
  static String get label_new_pin => "label_new_pin".tr();
  static String get label_confirm_pin => "label_confirm_pin".tr();
  static String get label_normal_password_label =>
      "label_normal_password_label".tr();
  static String get label_dse_verify_otp => "label_dse_verify_otp".tr();
  static String get label_nrc_front => "label_nrc_front".tr();
  static String get label_nrc_back => "label_nrc_back".tr();
  static String get label_forget_pin_1 => "label_forget_pin_1".tr();
  static String get label_forget_pin_2 => "label_forget_pin_2".tr();
  static String get label_forget_pin_3 => "label_forget_pin_3".tr();
  static String get label_forget_pin_4 => "label_forget_pin_4".tr();
  static String get label_fast_and_secure => "label_fast_and_secure".tr();
  static String get label_how_to_verify => "label_how_to_verify".tr();
  static String get label_biometric_alert => "label_biometric_alert".tr();
  static String get label_biometric_face_fingetprint =>
      "label_biometric_face_fingetprint".tr();
  static String get label_biometric_setting_turn_on =>
      "label_biometric_setting_turn_on".tr();
  static String get label_biometric_faceid_turn_on =>
      "label_biometric_faceid_turn_on".tr();
  static String get label_biometric_fingerprint_turn_on =>
      "label_biometric_fingerprint_turn_on".tr();

  static String get label_with_biometric => "label_with_biometric".tr();
  static String get label_biometric_turn_on => "label_biometric_turn_on".tr();
  static String get label_biometric_alert_one =>
      "label_biometric_alert_one".tr();
  static String get label_check_your_message => "label_check_your_message".tr();
  static String get label_start_pension_message =>
      "label_start_pension_message".tr();
  static String get label_biometric_finger_print =>
      "label_biometric_finger_print".tr();
  static String get label_biometric_face_id => "label_biometric_face_id".tr();

  static String label_biometric(String biometric) =>
      "label_biometric".tr(namedArgs: {"biometric": biometric.tr()});
  static String get label_alert => "label_alert".tr();

  static String get label_account_delete_success =>
      "label_account_delete_success".tr();
  static String get label_account_delete_success_1 =>
      "label_account_delete_success_1".tr();
  static String get label_account_delete_success_2 =>
      "label_account_delete_success_2".tr();

  static String get label_transfer_user_warning =>
      "label_transfer_user_warning".tr();
  static String get label_create_account => "label_create_account".tr();
  static String get label_verification_code_sent =>
      "label_verification_code_sent".tr();
  static String get label_cso_referral_code => "label_cso_referral_code".tr();
  static String get label_view_passcode => "label_view_passcode".tr();
  static String get label_hide_passcode => "label_hide_passcode".tr();
  static String get label_update_notice => "label_update_notice".tr();
  static String get button_update_now => "button_update_now".tr();
  static String get label_exit_title => "label_exit_title".tr();
  static String get label_exit_body => "label_exit_body".tr();
  static String get lable_press_circle_is_complete =>
      "lable_press_circle_is_complete".tr();

  static String get label_update_face_verification =>
      "label_update_face_verification".tr();
  static String get label_face_verification => "label_face_verification".tr();
  static String get label_face_verification_body =>
      "label_face_verification_body".tr();
  static String get label_married_status => "label_married_status".tr();
  static String get label_head_motion => "label_head_motion".tr();
  static String get label_face_verification_complete =>
      "label_face_verification_complete".tr();
  static String get label_face_verification_complete_body =>
      "label_face_verification_complete_body".tr();
  static String get label_face_verification_complete_married_status_body =>
      "label_face_verification_complete_married_status_body".tr();
  static String get label_no_internet_connection =>
      "label_no_internet_connection".tr();
  static String get label_check_your_network => "label_check_your_network".tr();

  // Text Button
  static String get text_button_next => "text_button_next".tr();
  static String get text_button_get_start => "text_button_get_start".tr();
  static String get text_button_help => "text_button_help".tr();
  static String get text_button_back => "text_button_back".tr();
  static String get text_button_clear => "text_button_clear".tr();
  static String get text_button_continue_to_marital_status =>
      "text_button_continue_to_marital_status".tr();
  static String get text_button_continue_to_home =>
      "text_button_continue_to_home".tr();

  static String get text_button_forgot_your_pin =>
      "text_button_forgot_your_pin".tr();
  static String get text_button_remind_later => "text_button_remind_later".tr();

  static String get text_button_resend_code => "text_button_resend_code".tr();

  static String get label_delete_confirm_pin => "label_delete_confirm_pin".tr();

  // Button

  static String get button_ok => "button_ok".tr();
  static String get button_login => "button_login".tr();
  static String get button_logout => "button_logout".tr();
  static String get button_sign_up => "button_sign_up".tr();
  static String get button_sign_in => "button_sign_in".tr();
  static String get button_register => "button_register".tr();
  static String get button_submit => "button_submit".tr();
  static String get button_save => "button_save".tr();
  static String get button_update => "button_update".tr();
  static String get button_cancel => "button_cancel".tr();
  static String get button_verify_now => "button_verify_now".tr();

  static String get button_search => "button_search".tr();
  static String get button_skip => "button_skip".tr();
  static String get button_transfer => "button_transfer".tr();
  static String get button_confirm_payment => "button_confirm_payment".tr();
  static String get button_retake => "button_retake".tr();
  static String get button_cash_request => "button_cash_request".tr();
  static String get button_top_up => "button_top_up".tr();
  static String get button_to_pay_bill => "button_to_pay_bill".tr();
  static String get button_click_here_to_scan =>
      "button_click_here_to_scan".tr();
  static String get button_confirm => "button_confirm".tr();
  static String get button_approve => "button_approve".tr();
  static String get button_close => "button_close".tr();
  static String get button_continue => "button_continue".tr();
  static String get button_upload_image => "button_upload_image".tr();
  static String get button_draw_signature => "button_draw_signature".tr();
  static String get button_clear_signature => "button_clear_signature".tr();
  static String get button_remove_image => "button_remove_image".tr();

  static String get button_scan_qr => "button_scan_qr".tr();

  static String get button_create_amount => "button_create_amount".tr();

  static String get button_save_image => "button_save_image".tr();
  static String get button_delete_account => "button_delete_account".tr();
  static String get button_download => "button_download".tr();
  static String get button_retry => "button_retry".tr();
  static String get button_skip_liveness => "button_skip_liveness".tr();

  static String get button_go_back => "button_go_back".tr();
  static String get button_back_to_login => "button_back_to_login".tr();
  static String get button_generate_qr => "button_generate_qr".tr();
  static String get button_get_otp => "button_get_otp".tr();
  static String get button_transfer_to_wallet =>
      "button_transfer_to_wallet".tr();
  static String get button_cashout => "button_cashout".tr();
  static String get button_try_again => "button_try_again".tr();

  static String get button_cashin => "button_cashin".tr();
  static String get button_nearby => "button_nearby".tr();
  static String get button_exit => "button_exit".tr();
  static String get button_exit_cancel => "button_exit_cancel".tr();
  static String get button_understand_continue =>
      "button_understand_continue".tr();

  // Error Message
  static String get error_message_something_went_wrong =>
      "error_message_something_went_wrong".tr();

  static String get error_message_invalid_myanmar_phone_number =>
      "error_message_invalid_myanmar_phone_number".tr();

  static String get error_message_enter_valid_number =>
      "error_message_enter_valid_number".tr();
  static String get error_message_invalid_user_id =>
      "error_message_invalid_user_id".tr();
  static String get error_message_invalid_otp =>
      "error_message_invalid_otp".tr();
  static String get error_message_enter_pin => "error_message_enter_pin".tr();

  static String get error_message_session_expired =>
      "error_message_session_expired".tr();

  static String get error_message_enter_phone_number =>
      "error_message_enter_phone_number".tr();
  static String get error_message_password_digit =>
      "error_message_password_digit".tr();
  static String get error_message_password_not_match =>
      "error_message_password_not_match".tr();
  static String get error_message_user_not_found =>
      "error_message_user_not_found".tr();
  static String get error_message_registration_fail =>
      "error_message_registration_fail".tr();
  static String get error_message_enter_nrc_number =>
      "error_message_enter_nrc_number".tr();

  static String get error_message_nrc_validation =>
      "error_message_nrc_validation".tr();
  static String get error_message_enter_cash_out_amount =>
      "error_message_enter_cash_out_amount".tr();
  static String get error_message_enter_valid_amount =>
      "error_message_enter_valid_amount".tr();
  static String get error_message_enter_ppa_no =>
      "error_message_enter_ppa_no".tr();
  static String get error_message_invalid_nrc_no =>
      "error_message_invalid_nrc_no".tr();

  static String get error_message_biometric_data_not_found =>
      "error_message_biometric_data_not_found".tr();

  static String get error_message_biometric_not_available =>
      "error_message_biometric_not_available".tr();

  static String get error_message_biometric_enroll =>
      "error_message_biometric_enroll".tr();

  static String get error_message_biometric_can_not_support =>
      "error_message_biometric_can_not_support".tr();

  static String get error_message_finger_print_not_enrolled =>
      "error_message_finger_print_not_enrolled".tr();

  static String get error_message_face_id_not_enrolled =>
      "error_message_face_id_not_enrolled".tr();

  static String get error_message_phone_number_not_match =>
      "error_message_phone_number_not_match".tr();

  static String get error_message_biometric_fail =>
      "error_message_biometric_fail".tr();
  static String get error_message_unsupport_version_update =>
      "error_message_unsupport_version_update".tr();

  // Confirm Message
  static String get cm_logout_alert => "cm_logout_alert".tr();
  static String get cm_exit_alert => "cm_exit_alert".tr();
  static String get cm_account_delete_alert => "cm_account_delete_alert".tr();
}
