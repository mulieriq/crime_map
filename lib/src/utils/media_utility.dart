import 'package:crime_map/src/provider/config/base_provider.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class MediaService extends BaseProvider {
  static List<Asset> images = <Asset>[];
  static Future<List<Asset>> getImages() async {
    List<Asset> resultList = <Asset>[];
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 4,
        enableCamera: false,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Upload Property Image",
          allViewTitle: "All Photos",
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
