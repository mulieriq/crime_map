import 'package:crime_map/src/helpers/common/app_constants.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class MediaService {
  static List<Asset> images = <Asset>[];
  static Future<List<Asset>> getImages() async {
    List<Asset> resultList = <Asset>[];
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 4,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: AppConstants.uploadLocationImage,
          allViewTitle: AppConstants.allPhotos,
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
      images = resultList;
      return resultList;
    } on Exception catch (_) {
      return images;
    }
  }
}
