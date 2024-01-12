import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:userinfo/feature/user_info/service/user_info_service.dart';

import '../model/user_model.dart';


class UserInfoController extends GetxController{

  UserInfoService service = UserInfoService();
  TextEditingController textEditingController = TextEditingController();
  RxBool isSearch = RxBool(false);

  Rxn<List<User?>?> userList = Rxn([]);
  Rxn<List<User?>?> searchUserList = Rxn([]);

  @override
  void onInit() async
  {
    await init();

    super.onInit();
  }

  Future<void> init() async{
    service.getUsers().then((value) {
      userList.value = value;
      searchUserList.value = userList.value;
    });
  }


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


  void search(String text)
  {
    isSearch.value = text.isNotEmpty;

    searchUserList.value = userList.value?.where((element) => element!.username!.toLowerCase().contains(text.toLowerCase())).toList();
  }

  void cancelSearch(){
    textEditingController.clear();
    search(textEditingController.text);
  }

}