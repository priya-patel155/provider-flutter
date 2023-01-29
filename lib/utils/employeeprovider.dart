import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../dataModel.dart';
import '../models/mutual_fund_details_model.dart';
import '../models/mutual_fund_model.dart';
import 'DataUtils.dart';

class EmployeeProvider extends ChangeNotifier {
  List<PracticeModel>? employeedatalist = [];
  List<MutualFundModel>? mutualFundModelList = <MutualFundModel>[];
  MutualFundDetailsModel? mutualFundDetailsModel;
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> EmpList({BuildContext? context}) async {
    setLoading(true);
    try {
      final response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      print(response.data);
      if (response.statusCode == 200) {
        List list = response.data;
        employeedatalist = list.map((element) {
          return PracticeModel.fromJson(element);
        }).toList();

        notifyListeners();
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
      print(e);
    }
  }

  Future<void> MutalFundListApi({BuildContext? context}) async {
    setLoading(true);
    try {
      final response = await Dio().get('https://api.mfapi.in/mf');
      print(response.data);
      if (response.statusCode == 200) {
        List list = response.data;
        mutualFundModelList = list.map((element) {
          return MutualFundModel.fromJson(element);
        }).toList();

        notifyListeners();
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
      print(e);
    }
  }

  Future<void> MutalFundLDetailsApi(
      {BuildContext? context, int? schemaCode}) async {
    setLoading(true);
    try {
      final response = await Dio().get('https://api.mfapi.in/mf/$schemaCode');
      print(response.data);
      if (response.statusCode == 200) {
        mutualFundDetailsModel = MutualFundDetailsModel.fromJson(response.data);
        notifyListeners();
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
      print(e);
    }
  }

  // Future<void> signUp({required BuildContext context}) async {
  //   Functions.checkConnectivity().then((value) async {
  //     if (value != null && value == true) {
  //       Map<String, dynamic> formdata = ({
  //         "full_name": "${_firstname.text} ${_lastname.text}",
  //         "email": _email.text,
  //         "mobile": _mobile.text,
  //         "image": imageurl,
  //         "country": "india",
  //         "city": "surat",
  //         "role": "rider",
  //         "currency": "ETB",
  //         "auth_code": 'BnB!t#Wallet\$&\$APp#MD'
  //       });
  //       await Provider.of<AuthProvider>(context, listen: false).singUp(
  //         data: formdata,
  //         context: context,
  //         email: _email.text,
  //       );
  //     }
  //   });
  // }

  // Future<void> singUp({
  //   required Map<String, dynamic> data,
  //   required BuildContext context,
  //   required String email,
  // }) async {
  //   setLoading(true);
  //   try {
  //     print(data);
  //     ApiResponseModel apiResponse =
  //     await _client.post('${Endpoints.signUp}', data: data);
  //     print("SignUp Api response data :- ");
  //     print(apiResponse.response);
  //
  //     if (apiResponse.success == true) {
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => OtpVerificationPage(
  //                 email: email,
  //               )));
  //
  //       final snackBar = SnackBar(
  //         content: Text(apiResponse.message.toString()),
  //       );
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //       setLoading(false);
  //     } else {
  //       setLoading(false);
  //       Functions.toast(apiResponse.message.toString());
  //     }
  //   } on DioError catch (e) {
  //     print(e.toString());
  //     setLoading(false);
  //     final errorMessage = DioExceptions.fromDioError(e).toString();
  //
  //   }
  // }

  /// image uplode api calling
  ///
  ///
  /// Future uplodeimage(File? image, BuildContext context) async {
//     try {
//       String fileName = image!.path.split('/').last;
//       FormData formdata = FormData.fromMap({
//         "image": await MultipartFile.fromFile(image!.path, filename: fileName),
//       });
//
//       final response = await Dio()
//           .post('https://api.bnbit.com/api/apps/upload-img', data: formdata);
//
//       ImageModel? imagemodel = ImageModel.fromJson(response.data);
//
//       if (imagemodel.success == true) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(const SnackBar(content: Text('Add profile')));
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(imagemodel!.message.toString())));
//       }
//     } on DioError catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(e.message)));
//     }
//   }

  // class SignUpPage extends StatefulWidget {
  // const SignUpPage({Key? key}) : super(key: key);
  //
  // @override
  // State<SignUpPage> createState() => _SignUpPageState();
  // }
  //
  // class _SignUpPageState extends State<SignUpPage> {
  // // languahe selction drop down
  // final List _language = [
  // 'English',
  // 'Amharic',
  // 'Germany',
  // 'Italy',
  // 'China',
  // 'French'
  // ];
  // int selection = 0;
  // bool _canSubmit = false;
  // bool value = false;
  // final TextEditingController _firstname = TextEditingController();
  // final TextEditingController _lastname = TextEditingController();
  // final TextEditingController _email = TextEditingController();
  // final TextEditingController _mobile = TextEditingController();
  // final TextEditingController _pass = TextEditingController();
  // final _signupForm = GlobalKey<FormState>();
  // final picker = ImagePicker();
  // File? image;
  // String? imageurl;
  // ImageModel? imagemodel;
  //
  // // registration api calling
  // Future<void> signUp({required BuildContext context}) async {
  // Functions.checkConnectivity().then((value) async {
  // if (value != null && value == true) {
  // Map<String, dynamic> formdata = ({
  // "full_name": "${_firstname.text} ${_lastname.text}",
  // "email": _email.text,
  // "mobile": _mobile.text,
  // "image": imageurl,
  // "country": "india",
  // "city": "surat",
  // "role": "rider",
  // "currency": "ETB",
  // "auth_code": 'BnB!t#Wallet\$&\$APp#MD'
  // });
  // await Provider.of<AuthProvider>(context, listen: false).singUp(
  // data: formdata,
  // context: context,
  // email: _email.text,
  // );
  // }
  // });
  // }
  //
  // // image pick
  // Future getImage() async {
  // final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  // if (pickedFile != null) {
  // image = File(pickedFile.path);
  // } else {}
  // await uplodeprofileimage(context: context);
  // setState(() {});
  // }
  //
  // // Toggles the password show status
  // bool _obscureText = true;
  // void _toggle() {
  // setState(() {
  // _obscureText = !_obscureText;
  // });
  // }
  //
  // Future<void> uplodeprofileimage({
  // required BuildContext context,
  // }) async {
  // print('uplode back image api calling');
  // String fileName = image!.path.split('/').last;
  // FormData formdata = FormData.fromMap({
  // "image": await MultipartFile.fromFile(image!.path, filename: fileName),
  // });
  // try {
  // print(formdata.fields);
  // final response = await Dio()
  //     .post('https://api.bnbit.com/api/apps/upload-img', data: formdata);
  //
  // imagemodel = ImageModel.fromJson(response.data);
  // setState(
  // () {
  // imageurl = imagemodel!.data!.filepathUrl;
  // },
  // );
  // print('imageurlllll ${imageurl}');
  // } on DioError catch (e) {
  // print(e.toString());
  // final errorMessage = DioExceptions.fromDioError(e).toString();
  // if (mounted) {
  //
  // }
  // }
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  // //  final model = Provider.of<SignUpProvider>(context, listen: false).setLoading()
  //
  // return Consumer<AuthProvider>(builder: (context, provider, child) {
  // return Stack(
  // children: [
  // Scaffold(
  // backgroundColor: Colors.white,
  // body: ScrollableColumn.withSafeArea(
  // padding: EdgeInsets.all(kPadding),
  // crossAxisAlignment: CrossAxisAlignment.start,
  // children: [
  // // SizedBox(height: kPadding),
  // // Align(
  // //     alignment: Alignment.center,
  // //     child: Image.asset(AppAssets.appLogo)),
  // Row(
  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  // children: [
  // Image.asset(
  // AppAssets.appLogo,
  // height: 40,
  // ),
  // Padding(
  // padding: const EdgeInsets.all(5),
  // child: Container(
  // padding: const EdgeInsets.all(5),
  // decoration: BoxDecoration(
  // color: AppColors.backgroundColor,
  // border: Border.all(color: AppColors.borderColor)),
  // child: Row(
  // children: [
  // Text(
  // 'English',
  // style: TextStyle(
  // fontSize: Sizes.s16.sp,
  // fontWeight: FontWeight.w600,
  // color: AppColors.secondaryColor),
  // ),
  // SizedBox(
  // width: Sizes.s8.w,
  // ),
  // GestureDetector(
  // onTap: () {
  // showModalBottomSheet(
  // enableDrag: true,
  // // isScrollControlled: true,
  // backgroundColor: Colors.transparent,
  // context: context,
  // builder: (context) {
  // return showmodelbottomsheet();
  // });
  // },
  // child: const Icon(
  // Icons.keyboard_arrow_down,
  // color: AppColors.secondaryColor,
  // ),
  // )
  // ],
  // ),
  // ),
  // ),
  // ],
  // ),
  // SizedBox(
  // height: Sizes.s30.h,
  // ),
  // userImage(),
  // SizedBox(
  // height: Sizes.s30.h,
  // ),
  // const HeadingText(text: "Sign Up"),
  // SizedBox(
  // height: Sizes.s10.h,
  // ),
  // Text(
  // "Welcome back, Sign Up to your account",
  // style:
  // TextStyle(fontSize: Sizes.s16.sp, color: AppColors.grey1),
  // ),
  // SizedBox(
  // height: Sizes.s30.h,
  // ),
  // Form(
  // key: _signupForm,
  // child: Column(
  // crossAxisAlignment: CrossAxisAlignment.start,
  // children: [
  // PrimaryTextField(
  // label: "First Name",
  // controller: _firstname,
  // hintText: "Enter first Name",
  // validator: firstnameValidator,
  // onChanged: (value) {
  // setState(() {
  // _canSubmit = true;
  // });
  // },
  // ),
  // SizedBox(
  // height: Sizes.s10.h,
  // ),
  // PrimaryTextField(
  // label: "Last Name",
  // controller: _lastname,
  // hintText: "Enter last Name",
  // validator: firstnameValidator,
  // onChanged: (value) {
  // setState(() {
  // _canSubmit = true;
  // });
  // },
  // ),
  // SizedBox(
  // height: Sizes.s10.h,
  // ),
  // PrimaryTextField(
  // label: "Email",
  // controller: _email,
  // validator: emailValidator,
  // hintText: "Enter your email ID",
  // onChanged: (value) {
  // setState(() {
  // _canSubmit = true;
  // });
  // },
  // ),
  // SizedBox(
  // height: Sizes.s10.h,
  // ),
  // PrimaryTextField(
  // label: "Mobile No.",
  // hintText: "Enter Your Mobile Number",
  // keyboardInputType: TextInputType.number,
  // controller: _mobile,
  // onChanged: (value) {
  // setState(() {
  // _canSubmit = true;
  // });
  // },
  // validator: mobileValidator,
  // prifix: CountryCodePicker(),
  // onTap: () {
  // //CountryCodePicker();
  // },
  // ),
  // SizedBox(
  // height: Sizes.s10.h,
  // ),
  // Row(
  // children: [
  // Checkbox(
  // value: value,
  // activeColor: AppColors.primaryColor,
  // onChanged: (newValue) {
  // setState(() {
  // value = newValue!;
  // print('hello');
  // });
  // }),
  // Container(
  // width: Sizes.s300.w,
  // child: Text(
  // 'By clicking an option below, I agree to the Terms of Use and have read the Privacy Statement.',
  // style: TextStyle(
  // fontWeight: FontWeight.w400,
  // fontSize: Sizes.s12.sp,
  // ),
  // ),
  // ),
  // ],
  // ),
  // SizedBox(
  // height: Sizes.s26.h,
  // ),
  // PrimaryButton(
  // label: "Get OTP",
  // color: _canSubmit == true && value == true
  // ? AppColors.primaryColor
  //     : Colors.grey.shade100,
  // fontcolor: _canSubmit && value
  // ? Colors.white
  //     : AppColors.greyDark,
  // onPressed: () async {
  // if (_signupForm.currentState!.validate()) {
  // if (image == null) {
  // print("2");
  // const snackBar = SnackBar(
  // content: Text("Please Select Profile image"),
  // );
  // ScaffoldMessenger.of(context)
  //     .showSnackBar(snackBar);
  // } else {
  // print('registration successfully');
  // await signUp(context: context);
  // }
  // }
  // }),
  // ],
  // ),
  // ),
  // SizedBox(
  // height: Sizes.s34.h,
  // ),
  // Align(
  // alignment: Alignment.bottomCenter,
  // child: Text.rich(
  // TextSpan(
  // text: 'Already have an account?',
  // style: TextStyle(
  // fontSize: Sizes.s16.sp,
  // color: AppColors.greyDark,
  // fontWeight: FontWeight.w400,
  // ),
  // children: [
  // WidgetSpan(child: SizedBox(width: Sizes.s8.h)),
  // TextSpan(
  // text: 'Log In',
  // style: TextStyle(
  // fontSize: Sizes.s16.sp,
  // color: AppColors.secondaryColor,
  // fontWeight: FontWeight.w700,
  // ),
  // recognizer: TapGestureRecognizer()
  // ..onTap = () {
  // Navigator.pushNamed(context, Routes.signIn);
  // }),
  // ],
  // ),
  // ),
  // ),
  // ],
  // ),
  // ),
  // Container(
  // child: provider.isLoading
  // ? Loder(bgColor: AppColors.black)
  //     : Container(),
  // ),
  // ],
  // );
  // });
  // }
  //
  // Widget userImage() {
  // //print(restaurantDetail!.restaurantImage);
  // return Center(
  // child: SizedBox(
  // height: ScreenUtil().setHeight(90),
  // width: ScreenUtil().setHeight(95),
  // child: Stack(
  // children: [
  // Align(
  // alignment: Alignment.center,
  // child: image != null
  // ? ClipRRect(
  // borderRadius: const BorderRadius.all(
  // Radius.circular(60),
  // ),
  // child: Image.file(
  // File(image!.path),
  // fit: BoxFit.cover,
  // height: ScreenUtil().setHeight(100),
  // width: ScreenUtil().setHeight(100),
  // ))
  //     : ImageView(
  // imageUrl:
  // 'https://yt3.ggpht.com/ytc/AKedOLSe_wLhIfzmXC_lyx6nQIvLsm8suZ7srFvdYM30=s900-c-k-c0x00ffffff-no-rj',
  // height: ScreenUtil().setHeight(100),
  // width: ScreenUtil().setHeight(100),
  // radius: ScreenUtil().setHeight(100) / 2,
  // ),
  // ),
  // Align(
  // alignment: Alignment.bottomRight,
  // child: InkWell(
  // onTap: () async {
  // getImage();
  // // await getimage();
  // },
  // child: Container(
  // padding: EdgeInsets.all(Sizes.s4.h),
  // decoration: const BoxDecoration(
  // color: AppColors.primaryColor,
  // shape: BoxShape.circle,
  // ),
  // child: const Icon(
  // Icons.add,
  // color: Colors.white,
  // size: 20,
  // ),
  // ),
  // ),
  // )
  // ],
  // ),
  // ),
  // );
  // }
  //
  // Widget showmodelbottomsheet() {
  // return Container(
  // height: ScreenUtil().screenHeight * 0.10,
  // padding: EdgeInsets.all(kPadding),
  // decoration: BoxDecoration(
  // color: Colors.white,
  // borderRadius: BorderRadius.only(
  // topLeft: Radius.circular(40), topRight: Radius.circular(40)),
  // ),
  // child: Column(
  // children: [
  // Text(
  // 'Choose language',
  // style: TextStyle(
  // fontWeight: FontWeight.w600,
  // fontSize: Sizes.s20.sp,
  // color: AppColors.secondaryColor),
  // ),
  // SizedBox(
  // height: Sizes.s20.h,
  // ),
  // Container(
  // height: ScreenUtil().screenHeight * 0.38,
  // child: ListView.builder(
  // itemCount: _language.length,
  // shrinkWrap: true,
  // itemBuilder: (BuildContext context, int index) {
  // return GestureDetector(
  // onTap: () {
  // setState(() {
  // selection = index;
  // });
  // },
  // child: Column(
  // children: [
  // Row(
  // children: [
  // SvgPicture.asset(
  // AppAssets.italy,
  // ),
  // SizedBox(
  // width: Sizes.s10.w,
  // ),
  // Text(
  // _language[index],
  // style: TextStyle(
  // fontSize: Sizes.s16.sp,
  // fontWeight: FontWeight.w600,
  // color: AppColors.secondaryColor),
  // ),
  // const Spacer(),
  // Icon(
  // Icons.check,
  // color: selection == index
  // ? AppColors.secondaryColor
  //     : Colors.transparent,
  // )
  // ],
  // ),
  // SizedBox(
  // height: Sizes.s16.h,
  // )
  // ],
  // ),
  // );
  // }),
  // ),
  // SizedBox(
  // height: Sizes.s10.h,
  // ),
  // PrimaryButton(label: 'Done', onPressed: () async {}),
  // ],
  // ));
  // }
  //
  // String? emailValidator(value) {
  // if (value.length == 0) {
  // return "Please enter your email address !";
  // } else if (!Regex.email_expression.hasMatch(value)) {
  // return "Please enter your email address !";
  // }
  // return null;
  // }
  //
  // String? mobileValidator(value) {
  // if (value.length == 0) {
  // return "Please enter your mobile number!";
  // } else if (value.length < 10) {
  // return "Please enter a valid mobile number!";
  // } else if (value.length > 10) {
  // return "Please enter a valid mobile number!";
  // }
  // return null;
  // }
  //
  // String? firstnameValidator(value) {
  // if (value.length == 0) {
  // return "Please enter your first name !";
  // }
  // return null;
  // }
  //
  // String? lastnameValidator(value) {
  // if (value.length == 0) {
  // return "Please enter your last name !";
  // }
  // return null;
  // }
  // }
  //
  //

/* otp verification


 Future<void> otpVerification(
      {required Map<String, dynamic> data,
      required BuildContext context}) async {
    //  setLoading(true);
    try {
      print(data);
      SharedPreferences shared = await SharedPreferences.getInstance();
      String type = shared.getString("authType") ?? "";

      ApiResponseModel apiResponse =
          await _client.post(type.isNotEmpty && type=="login"?'${Endpoints.otp}':Endpoints.otpRegister, data: data);
      print("otp verification Api response data :- ");
      print(apiResponse.response);
      _usermodel = UserModel.fromJson(apiResponse.response['user']);
      print(_usermodel!.toJson());

      if (apiResponse.success == true) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        String data = jsonEncode(_usermodel);
        sharedPreferences.setString('register', data);
        print('hello data ${data}');
        if (apiResponse.response['merchant'] != null) {
          sharedPreferences.setString(
              "registermerchant", jsonEncode(apiResponse.response['merchant']));
        }
        Provider.of<UserProvider>(context, listen: false)
            .setUserModel(_usermodel!);
        if (sharedPreferences.getString('registermerchant') != null) {
          await Provider.of<MerchantProvider>(context, listen: false)
              .merchantGetProfile(context: context);
        }
        Navigator.pushNamed(context, Routes.verifyId);
        final snackBar = SnackBar(
          content: Text(apiResponse.message.toString()),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // setLoading(false);
      } else {
        //setLoading(false);
        Functions.toast(apiResponse.message.toString());
        //setLoading(false);
      }
    } on DioError catch (e) {
      print(e.toString());
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e).toString();

    }
  }
 */

/* import 'dart:convert';
import 'dart:io';
import 'package:bnbit/core/constants/constants.dart';
import 'package:bnbit/core/provider/authprovider.dart';
import 'package:bnbit/core/routes/app_routes.dart';
import 'package:bnbit/views/widgets/primary_app_bar.dart';
import 'package:bnbit/views/widgets/primary_button.dart';
import 'package:bnbit/views/widgets/primary_text_field.dart';
import 'package:bnbit/views/widgets/scrollable_column.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/data/api_response_model.dart';
import '../../../../core/data/services/api_endpoints.dart';
import '../../../../core/data/services/dio_client.dart';
import '../../../../core/data/services/exception.dart';
import '../../../../core/data/services/prefreances.dart';
import '../../../../core/global/global_funcations.dart';
import '../../../../core/provider/user_provider.dart';
import '../../../../core/utils/utils.dart';
import '../../../../models/getprofilemodel.dart';
import '../../../../models/image_model.dart';
import '../../../../models/usermodel.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/dailog_widgets/show_custom_dialog.dart';
import '../../../widgets/image_view.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({Key? key}) : super(key: key);

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  final ValueNotifier<bool> _isEditModeNotifier = ValueNotifier<bool>(false);
  bool get isEditMode => _isEditModeNotifier.value;
  final _signupForm = GlobalKey<FormState>();
  UserModel? _usermodel;
  ProfileModel? _getProfileModel;
  String? token;
  String? fname;
  String? lname;
  String? email;
  String? id;
  DioClient _client = DioClient();
  File? image;
  ImageModel? imagemodel;
  String? imageurl;
  String? fullname;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    getdata();
  }

// get data
  getdata() async {
    Functions.checkConnectivity().then((value) async {
      SharedPreferences shared = await SharedPreferences.getInstance();
      Map<String, dynamic> data = jsonDecode(shared.getString('register')!);

      setState(() {
        _usermodel = UserModel.fromJson(data);
        fullname = _usermodel!.fullName!.toString();
        token = _usermodel!.token!;
        email = _usermodel!.email!;
        _firstname.text = _usermodel!.fullName ?? '';
        _email.text = _usermodel!.email!;
        _mobile.text = _usermodel!.mobile!;
        imageurl = _usermodel!.image!.toString();
      });
      print('usermodel ${_usermodel!.fullName}');
      print('token access ${token}');
      print('imageurl ${imageurl}');
    });
  }

//get image
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      await uplodeimage();
    } else {}
    setState(() {});
  }

  // uplode image
  Future uplodeimage() async {
    try {
      String fileName = image!.path.split('/').last;
      FormData formdata = FormData.fromMap({
        "image": await MultipartFile.fromFile(image!.path, filename: fileName),
      });

      final response = await Dio()
          .post('https://api.bnbit.com/api/apps/upload-img', data: formdata);

      imagemodel = ImageModel.fromJson(response.data);
      _usermodel!.image = imagemodel!.data!.filepathUrl;
      SharedPreferences shared = await SharedPreferences.getInstance();
      shared.setString("register", jsonEncode(_usermodel));
      setState(() {
        imageurl = imagemodel!.data!.filepathUrl;
      });

      if (imagemodel!.success == true) {
        print('add profile');
        await updateprofile(context: context);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Add profile')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(imagemodel!.message.toString())));
      }
    } on DioError catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  //update profile
  Future<void> updateprofile({required BuildContext context}) async {
    Functions.checkConnectivity().then((value) async {
      print('update api calling');
      if (value != null && value == true) {
        Map<String, dynamic> formdata =
            ({"full_name": _firstname.text, "currency": "ETB"});

        await Provider.of<UserProvider>(context, listen: false).updateprofile(
          context: context,
          data: formdata,
          token: token.toString(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackHomeAppBar(
            onPressed: () {
              Navigator.pop(context);
            },
            title: "Personal Data"),
        body: ValueListenableBuilder<bool>(
            valueListenable: _isEditModeNotifier,
            builder: (context, value, _) {
              return Consumer<UserProvider>(
                builder: (context, data, child) {
                  return ScrollableColumn.withSafeArea(
                    padding: EdgeInsets.all(kPadding),
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          userImage(),
                          SizedBox(
                            width: Sizes.s20.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${data.userModel!.fullName}",
                                style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: Sizes.s20.sp),
                              ),
                              SizedBox(height: Sizes.s4.h),
                              Text(
                                email ?? '',
                                style: TextStyle(
                                    color: AppColors.grey1,
                                    fontWeight: FontWeight.w400,
                                    fontSize: Sizes.s14.sp),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: Sizes.s30.h),
                      PrimaryTextField(
                          controller: _firstname,
                          label: "Name",
                          hintText: "Name",
                          hintTextColor: AppColors.secondaryColor,
                          hintFontWeight: FontWeight.w600,
                          readOnly: isEditMode
                          //readOnly: true,
                          ),
                      SizedBox(height: Sizes.s10.h),
                      PrimaryTextField(
                        controller: _email,
                        label: "Email",
                        hintText: "Email",
                        hintTextColor: AppColors.secondaryColor,
                        hintFontWeight: FontWeight.w600,
                        readOnly: true,
                      ),
                      SizedBox(height: Sizes.s10.h),
                      PrimaryTextField(
                        label: "Mobile No.",
                        hintText: "Mobile",
                        readOnly: true,
                        hintFontWeight: FontWeight.w600,
                        hintTextColor: AppColors.secondaryColor,
                        controller: _mobile,
                        prifix: CountryCodePicker(),
                        onTap: () {
                          CountryCodePicker();
                        },
                      ),
                      SizedBox(height: Sizes.s50.h),
                      PrimaryButton(
                          label: isEditMode ? "Save" : "Edit Profile",
                          onPressed: () async {
                            // Navigator.pushNamed(context, Routes.editProfile);

                            if (isEditMode) {
                              _isEditModeNotifier.value = false;
                            } else {
                              _isEditModeNotifier.value = true;

                              await updateprofile(context: context);
                            }
                          })
                    ],
                  );
                },
              );
            }));
  }

  Widget userImage() {
    //print(restaurantDetail!.restaurantImage);
    return SizedBox(
      height: ScreenUtil().setHeight(90),
      width: ScreenUtil().setHeight(95),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: image != null
                ? ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(60),
                    ),
                    child: Image.file(
                      File(image!.path),
                      fit: BoxFit.cover,
                      height: ScreenUtil().setHeight(86),
                      width: ScreenUtil().setHeight(86),
                    ))
                : ImageView(
                    imageUrl: imageurl != null && imageurl!.isNotEmpty
                        ? "${Endpoints.baseUrl}/uploads/$imageurl"
                        //imageurl.toString()
                        //"${Endpoints.baseUrl}/uploads/$imageurl"
                        : 'https://yt3.ggpht.com/ytc/AKedOLSe_wLhIfzmXC_lyx6nQIvLsm8suZ7srFvdYM30=s900-c-k-c0x00ffffff-no-rj',
                    height: ScreenUtil().setHeight(86),
                    width: ScreenUtil().setHeight(86),
                    radius: ScreenUtil().setHeight(86) / 2,
                  ),
          ),
          isEditMode
              ? Container()
              : Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () async {
                      getImage();
                      // await getimage();
                    },
                    child: Container(
                      padding: EdgeInsets.all(Sizes.s8.h),
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.photo_camera_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
} */

}
