import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userinfo/core/extension/context_extension.dart';
import 'package:userinfo/feature/user_info/model/photo_model.dart';

import '../controller/user_info_controller.dart';
import '../model/user_model.dart';


class UserInfoScreen extends GetView<UserInfoController> {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.white,
          title: Text("IWallet",style: Theme.of(context).textTheme.titleLarge,),
        ),
        body: Column(
          children: [
            buildContainerSearch(context),
            Expanded(child:buildObx(context)
            ),
          ],
        )
    );
  }

  Container buildContainerSearch(BuildContext context) {
    return Container(
            padding:context.paddingLowHorizontal,
            height:  context.dynamicHeight(10),
            alignment: Alignment.center,
            color: Colors.white,
            child: CupertinoTextField(
              prefix:  const IconButton(onPressed:null,icon:Icon(Icons.search)),
              suffix:  Obx(()=>Visibility(
                  visible: controller.isSearch.value,
                  child: IconButton(onPressed:controller.cancelSearch, icon: Icon(Icons.cancel))
              )) ,
              controller: controller.textEditingController,
              cursorColor:Colors.grey.shade400,
              onChanged:controller.search,
              decoration:  BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20)

              ),
            ),
          );
  }

  Obx buildObx(BuildContext context) {
    return Obx(() {
      return controller.userList.value?.isEmpty == true
          ? const CupertinoActivityIndicator()
          : controller.searchUserList.value?.isEmpty ==true
          ? Center(child: Text("Kullanıcı Bulunamadı!"))
          :ListView.builder(
          itemCount: controller.searchUserList.value?.length,
          padding: context.paddingLow,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: ()async{
                await buildShowDialog(context:context,user: controller.searchUserList.value![index]!);
              },
              child: ListTile(
                leading: buildFutureBuilder(id:controller.searchUserList.value![index]?.id),
                trailing: Icon(Icons.navigate_next_rounded),
                title: Text(controller.searchUserList.value?[index]?.name ?? ""),
                subtitle: Text(controller.searchUserList.value?[index]?.username ?? ""),
              ),
            );
          }
      )
      ;
    });
  }

  Future<void> buildShowDialog({required BuildContext context,required User user}) {
    return showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (context) {
              return  Dialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: buildContainer(context, user)
              );
              });
  }

  Container buildContainer(BuildContext context, User user) {
    return Container(
      width: context.dynamicWidht(90),
      height: context.dynamicHeight(60),
      padding: context.paddingLow,
      child: Column(
        children: [
          Expanded(flex: 2, child:buildStack(user, context)),
          Expanded(flex: 1,child: buildColumn(user, context)),
          Expanded(flex: 4, child: buildSingleChildScrollView(context, user)),

        ],
      ),

    );
  }

  Stack buildStack(User user, BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child:buildFutureBuilder(id:user.id,radius: context.dynamicHeight(10)),
        ),
        Align(
            alignment: Alignment.topRight,
            child: IconButton(onPressed: Get.back, icon: Icon(Icons.close,size: context.dynamicHeight(3),))
        )
      ],
    );
  }

  Column buildColumn(User user, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(user.name??"",style: Theme.of(context).textTheme.titleLarge,),
        Text("@${user.username}",style:Theme.of(context).textTheme.titleMedium ,),
      ],
    );
  }


  SingleChildScrollView buildSingleChildScrollView(BuildContext context, User user) {
    return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildText(context:context,title: "Email",desc:user.email),
                  buildText(context:context,title: "Telefon",desc:user.phone),
                  buildText(context:context,title: "Adres",desc:"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
                  buildText(context:context,title: "Şehir",desc:user.address?.city),
                  buildText(context:context,title: "Konum",desc:"${user.address?.geo?.lat}/${user.address?.geo?.lng}"),
                ],
              ),
            );
  }

  Padding buildText({required BuildContext context, required String title,String? desc}) =>
      Padding(
        padding: context.paddingLow,
          child: Text("${title} : ${desc??""}",style: Theme.of(context).textTheme.titleMedium,)
      );




  FutureBuilder<Photo?> buildFutureBuilder({int? id,double? radius}) {
    return FutureBuilder<Photo?>(
              future:controller.service.getUserPhoto(id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                return CircleAvatar(radius:radius ,backgroundImage:snapshot.hasError? null: NetworkImage(snapshot.data?.downloadUrl??"https://linguistics.ucla.edu/wp-content/uploads/2020/06/placeholder.jpg"),
                );
              },
            );
  }

}
