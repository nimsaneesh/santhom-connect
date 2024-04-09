import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:santhom_connect/presentation/profile_page/models/my_family_model.dart';
import '../../../core/app_export.dart';
import '../../directory_profile_screen/models/directory_profile_model.dart';
import '../models/edit_profile_model.dart';
import '../models/prayer_group_model.dart';
import '../models/update_family_respo.dart';
import '../repo/edit_profile_repo.dart';

/// A provider class for the EditProfileScreen.
///
/// This provider manages the state of the EditProfileScreen, including the
/// current editProfileModelObj

// ignore_for_file: must_be_immutable
class EditProfileProvider extends ChangeNotifier {
  TextEditingController familyNameController = TextEditingController();
  TextEditingController headOfFamilyController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController mapLocationGroupController = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  EditProfileModel editProfileModelObj = EditProfileModel();

  PrayerGroupRespo prayerGroupList = PrayerGroupRespo();
  UpdateFamilyRespo familyUpdateRespo = UpdateFamilyRespo();
  bool _isLoading = false;
  final EditProfileRepo _repo = EditProfileRepo();
  bool get isLoading => _isLoading;
  var prayer_grp_id = 0;

  List<SelectionPopupModel>? prayerGroupItems = [];
  saveData() async {
    if (familyNameController.text != "" &&
        headOfFamilyController.text != "" &&
        emailController.text != "" &&
        addressController.text != "" &&
        address2Controller.text != "" &&
        pincodeController.text != "" &&
        mapLocationGroupController.text != "") {
      loader(true);
      familyUpdateRespo = await _repo.editProfile(
        family_name: familyNameController.text,
        prayer_group_id: prayer_grp_id.toString(),
        address1: addressController.text,
        address2: address2Controller.text,
        post_office: pincodeController.text,
        pincode: pincodeController.text,
        map_location: mapLocationGroupController.text,
      );

      if (familyUpdateRespo.status == "success") {
        Fluttertoast.showToast(
            msg: "Update Success ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        NavigatorService.goBack();
      }else{
        Fluttertoast.showToast(
            msg: "Update failed ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
 
    } else {
      Fluttertoast.showToast(
          msg: "Fill all values ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  loader(bool load) {
    _isLoading = load;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    familyNameController.dispose();
    headOfFamilyController.dispose();
    emailController.dispose();
    addressController.dispose();
    address2Controller.dispose();
    pincodeController.dispose();
    mapLocationGroupController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in prayerGroupItems!) {
      element.isSelected = false;
      if (element.id == value.id) {
        prayer_grp_id = element.id!;
        element.isSelected = true;
      }
    }
    notifyListeners();
  }

  onSelected1(dynamic value) {
    for (var element in editProfileModelObj.dropdownItemList1) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }

  onSelected2(dynamic value) {
    for (var element in editProfileModelObj.dropdownItemList2) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }

  onSelected3(dynamic value) {
    for (var element in editProfileModelObj.dropdownItemList3) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }

  Data? data = null;
  Future<void> setData(Data model) async {
    loader(true);
    prayerGroupList = await _repo.getPrayerGroup();
    data = model;
    familyNameController.text = model?.family?.familyName ?? "";
    headOfFamilyController.text = model?.family?.familyHeadName ?? "";
    addressController.text = model?.family?.address1 ?? "";
    pincodeController.text = model?.family?.postOffice ?? "";
    mapLocationGroupController.text = model?.family?.mapLocation ?? "";
    prayerGroupItems = prayerGroupList?.data?.map((data) {
      return SelectionPopupModel(
        id: data.id,
        title: data.groupName ?? "",
        isSelected: data.id == model.family?.prayerGroupId,
      );
    }).toList();
    loader(false);
    notifyListeners();
  }
}
