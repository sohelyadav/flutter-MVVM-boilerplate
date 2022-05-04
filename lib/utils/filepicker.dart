import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_mvvm_boilerplate/app/app.locator.dart';
import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter_mvvm_boilerplate/resources/demins.dart';
import 'package:flutter_mvvm_boilerplate/resources/themes.dart';
import 'package:flutter_mvvm_boilerplate/ui/components/preDefined/snackbar.dart';

Future<File?> openPickImageModalSheet(BuildContext context) async {
  File? file;
  SnackbarService _snackbarService = locator<SnackbarService>();
  NavigationService _navigationService = locator<NavigationService>();
  await showModalBottomSheet(
    context: context,
    barrierColor: kBlack.withOpacity(0.2),
    builder: (context) => SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: kWhite,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: kAppPadding, top: kAppPadding),
              child: Text("Choose From", style: appTheme.textTheme.bodyText1),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kAppPadding),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2)
                        ]),
                    width: MediaQuery.of(context).size.width / 3 - 25,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      splashColor: kBlack.withOpacity(0.2),
                      padding: EdgeInsets.all(kAppPadding),
                      onPressed: () async {
                        await pickImage(ImageSource.camera).then((image) async {
                          if (image == null)
                            _snackbarService.showCustomSnackBar(
                                duration: Duration(seconds: 5),
                                message: "Image capture failed",
                                variant: SnackbarType.error);
                          else {
                            // await _navigationService
                            //     .navigateTo(Routes.doktorsCropImage,
                            //         arguments:
                            //             DoktorsCropImageArguments(
                            //                 imageFile: image))
                            //     .then((value) => file = value);
                            file = image;
                          }
                        });
                        Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera,
                            size: 24,
                            color: kPrimaryColor,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Camera",
                            style: appTheme.textTheme.bodyText1!
                                .copyWith(fontSize: 12, color: kBlack),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: kAppPadding,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2)
                        ]),
                    width: MediaQuery.of(context).size.width / 3 - 25,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      splashColor: kBlack.withOpacity(0.2),
                      padding: EdgeInsets.all(kAppPadding),
                      onPressed: () async {
                        await pickImage(ImageSource.gallery)
                            .then((image) async {
                          if (image == null)
                            _snackbarService.showCustomSnackBar(
                                duration: Duration(seconds: 5),
                                message: "Image capture failed",
                                variant: SnackbarType.error);
                          else {
                            // await _navigationService
                            //     .navigateTo(Routes.doktorsCropImage,
                            //         arguments:
                            //             DoktorsCropImageArguments(
                            //                 imageFile: image))
                            //     .then((value) => file = value);
                            file = image;
                          }
                        });
                        Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.photo_album,
                            size: 24,
                            color: kPrimaryColor,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Gallery",
                            style: appTheme.textTheme.bodyText1!
                                .copyWith(fontSize: 12, color: kBlack),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: kAppPadding,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2)
                        ]),
                    width: MediaQuery.of(context).size.width / 3 - 25,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      splashColor: kBlack.withOpacity(0.2),
                      padding: EdgeInsets.all(kAppPadding),
                      onPressed: () async {
                        await pickFile().then((image) {
                          if (image == null) {
                          } else {
                            file = image;
                          }
                        });
                        Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.file_copy,
                            size: 24,
                            color: kPrimaryColor,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "File",
                            style: appTheme.textTheme.bodyText1!
                                .copyWith(fontSize: 12, color: kBlack),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
    ),
  );
  if (file != null) {
    print("File path ======" + (file?.path ?? ''));
    Uint8List? testunit = await file!.readAsBytes();
    print("Actual file size in byte==" + testunit.lengthInBytes.toString());
    if (testunit.lengthInBytes >= 500000) {
      double quality = (500000 / testunit.lengthInBytes) * 100;

      print("-----$file");
      return file;
    } else {
      return file;
    }
  }
  return null;
}

Future<File?> openPickVideoModalSheet(BuildContext context) async {
  late File file;
  SnackbarService _snackbarService = locator<SnackbarService>();
  await showModalBottomSheet(
      context: context,
      builder: (context) => Container(
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.all(Radius.circular(15)),
            ),
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Pick a Video",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: kPrimaryColor),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  child: Text(
                    "Use camera",
                  ),
                  onPressed: () async {
                    await pickVideo(ImageSource.camera).then((video) {
                      if (video == null)
                        _snackbarService.showCustomSnackBar(
                            duration: Duration(seconds: 5),
                            message: "Video capture failed",
                            variant: SnackbarType.error);
                      else
                        file = video;
                    });
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text(
                    "Use Gallery",
                  ),
                  onPressed: () async {
                    await pickVideo(ImageSource.gallery).then((video) {
                      if (video == null)
                        _snackbarService.showCustomSnackBar(
                            duration: Duration(seconds: 5),
                            message: "Video capture failed",
                            variant: SnackbarType.error);
                      else
                        file = video;
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ));
  return file;
}

Future<File?> pickImage(ImageSource source,
    {CameraDevice preferredCameraDevice = CameraDevice.rear}) async {
  SnackbarService _snackbarService = locator<SnackbarService>();

  PickedFile? imagePickedFile = await ImagePicker().getImage(
      source: source,
      preferredCameraDevice: preferredCameraDevice,
      imageQuality: 50,
      maxHeight: 1280,
      maxWidth: 960);
  if (imagePickedFile != null) {
    if (await File(imagePickedFile.path).length() >= 2097152)
      _snackbarService.showCustomSnackBar(
          duration: Duration(seconds: 5),
          message: "The File may not be greater than 2 MB.");
    else
      return File(imagePickedFile.path);
  } else
    return null;
}

Future<File?> pickFile() async {
  SnackbarService _snackbarService = locator<SnackbarService>();
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(allowMultiple: false);
  if (result != null) {
    if (result.files.single.size >= 2097152) {
      await _snackbarService.showCustomSnackBar(
          duration: Duration(seconds: 5),
          message: "The File may not be greater than 2 MB.",
          variant: SnackbarType.error);
      return null;
    } else
      return File(result.files.single.path ?? '');
  } else {
    return null;
  }
}

Future<File?> pickVideo(ImageSource source) async {
  PickedFile? imagePickedFile = await ImagePicker()
      .getVideo(source: source, maxDuration: Duration(seconds: 30));
  if (imagePickedFile != null) {
    return File(imagePickedFile.path);
  } else
    return null;
}
