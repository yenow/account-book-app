import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class IconConverter {
  static IconData? iconConverter(String iconName) {
    if (iconName.contains('현금성 자산')) {
      return FluentIcons.money_20_regular;
    } else if (iconName.contains('현금')) {
      return FluentIcons.wallet_20_regular;
    } else if (iconName.contains('예금')) {
      return FluentIcons.building_bank_20_regular;
    } else if (iconName.contains('상품권')) {
      return FluentIcons.gift_card_money_20_regular;
    } else if (iconName.contains('선불카드')) {
      return FluentIcons.card_ui_20_regular;
    } else if (iconName.contains('투자')) {
      return FluentIcons.book_coins_20_regular;
    } else if (iconName.contains('적금')) {
      return FluentIcons.savings_20_regular;
    } else if (iconName.contains('주식')) {
      return FluentIcons.arrow_trending_20_regular;
    } else if (iconName.contains('펀드')) {
      return FluentIcons.data_usage_20_regular;
    } else if (iconName.contains('기타')) {
      return FluentIcons.more_circle_20_regular;
    } else if (iconName.contains('건물')) {
      return FluentIcons.building_20_regular;
    } else if (iconName.contains('퇴직')) {
      return FluentIcons.person_arrow_left_20_regular;
    } else if (iconName.contains('총 자산')) {
      return FluentIcons.select_all_off_20_regular;
    } else if (iconName.contains('급여')) {
      return FluentIcons.wallet_20_regular;
    }else if (iconName.contains('식비')) {
      return FluentIcons.food_20_regular;
    }else if (iconName.contains('생활')) {
      return FluentIcons.cart_20_regular;
    }else if (iconName.contains('교통')) {
      return FluentIcons.airplane_20_regular;
    }else if (iconName.contains('의류')) {
      return FluentIcons.wallet_20_regular;
    }else if (iconName.contains('병원')) {
      return FluentIcons.building_20_regular;
    }else if (iconName.contains('취미')) {
      return FluentIcons.vehicle_bicycle_20_regular;
    }else if (iconName.contains('교육')) {
      return FluentIcons.person_chat_20_regular;
    }else if (iconName.contains('전기')) {
      return FluentIcons.lightbulb_20_regular;
    }else if (iconName.contains('가스')) {
      return FluentIcons.gas_20_regular;
    }else if (iconName.contains('관리비')) {
      return FluentIcons.home_add_20_regular;
    }else if (iconName.contains('월세')) {
      return FluentIcons.home_add_20_regular;
    }else if (iconName.contains('세금')) {
      return FluentIcons.wallet_20_regular;
    }else if (iconName.contains('경조사')) {
      return FluentIcons.person_5_20_regular;
    }else if (iconName.contains('명절비')) {
      return FluentIcons.person_5_20_regular;
    }

    return FluentIcons.bookmark_20_regular;
  }
}

