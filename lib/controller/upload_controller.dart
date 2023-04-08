import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadController extends GetxController {
  // showModalBottomSheet애서 빌더를 돌려주므로 albums는 굳이 상태관리를 해줄 필요가 없다.
  var albums = <AssetPathEntity>[];
  // GetX에서 OBS를 사용하면 위젯을 업데이트할 필요 없이 데이터 변경에 따라 자동으로 뷰가 업데이트
  RxList<AssetEntity> imageList = <AssetEntity>[].obs;
  RxString headerTitle = ''.obs;
  Rx<AssetEntity> selectedImage = const AssetEntity(
    id: '0',
    typeInt: 0,
    width: 0,
    height: 0,
  ).obs;
  @override
  void onInit() {
    super.onInit();
    _loadPhotos();
  }

  void _loadPhotos() async {
    // 허가 요청
    var result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      albums = await PhotoManager.getAssetPathList(
        onlyAll: true,
        type: RequestType.image,
        filterOption: FilterOptionGroup(
          imageOption: const FilterOption(
            sizeConstraint: SizeConstraint(
              minHeight: 100,
              minWidth: 100,
            ),
          ),
          orders: [
            const OrderOption(type: OrderOptionType.createDate, asc: false)
          ],
        ),
      );
      // albums.addAll([
      //   AssetPathEntity(id: '', name: '1'),
      //   AssetPathEntity(id: '', name: '1'),
      // ]);
      _loadData();
    } else {
      // message 권한 요청
    }
  }

  void _loadData() async {
    changeAlbum(albums.first);

    // update();
  }

  Future<void> _pagingPhotos(AssetPathEntity album) async {
    imageList.clear();
    var photos = await album.getAssetListPaged(page: 0, size: 30);
    imageList.addAll(photos);
    changeSelectedImage(imageList.first);
  }

  changeSelectedImage(AssetEntity image) {
    selectedImage(image);
  }

  void changeAlbum(AssetPathEntity album) async {
    headerTitle(album.name);
    await _pagingPhotos(album);
    Get.back();
  }
}
