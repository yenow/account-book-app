import 'dart:collection';

import 'package:account_book/data/model/trade.dart';
import 'package:account_book/data/model/category.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get to => Get.find();
  final categories = Rx<List<Category>>([
    Category(id: 1, name: '월급', type: 'income', description: '수입'),
    Category(id: 2, name: '돌발 수입', type: 'income', description: '수입'),
    Category(id: 3, name: '용돈', type: 'income', description: '수입'),
    Category(id: 4, name: '이월', type: 'income', description: '수입'),
    Category(id: 5, name: '자산 인출', type: 'income', description: '수입'),
    Category(id: 6, name: '기타', type: 'income', description: '수입'),
    Category(id: 7, level: 1, name: '변동 지출', type: 'expense', description: '지출'),
    Category(id: 10, parentId: 7, level: 2, name: '식비', type: 'expense', description: '지출'),
    Category(id: 11, parentId: 7, level: 2, name: '생활 용품비', type: 'expense', description: '지출'),
    Category(id: 12, parentId: 7, level: 2, name: '교통 유류비', type: 'expense', description: '지출'),
    Category(id: 8, level: 1, name: '고정 지출', type: 'expense', description: '지출'),
    Category(id: 20, parentId: 8, level: 2, name: '전기세', type: 'expense', description: '지출'),
    Category(id: 9, level: 1, name: '돌발 지출', type: 'expense', description: '지출'),
    Category(id: 30, parentId: 9, level: 2, name: '카드 대금', type: 'expense', description: '지출'),
  ]);
}
