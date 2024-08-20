import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/constants/app_text_style.dart';
import 'package:clean_architecture/features/food/presentation/widgets/follow_info.dart';
import 'package:clean_architecture/features/food/presentation/widgets/like_info.dart';
import 'package:flutter/material.dart';

class FoodDetaiProp {
  final String name;
  final int price;
  final String image;
  final int like;
  final int following;
  final bool isLiked;
  final String description;
  final String ingredients;
  final String cooking;

  FoodDetaiProp({
    required this.name,
    required this.price,
    required this.image,
    required this.like,
    required this.isLiked,
    required this.following,
    required this.description,
    required this.ingredients,
    required this.cooking,
  });
}

class DetailFoodPage extends StatelessWidget {
  DetailFoodPage({super.key});

  final food = FoodDetaiProp(
      name: "Bún bò Huế",
      price: 45000,
      image:
          "https://i.pinimg.com/564x/04/b6/f9/04b6f958f5f053fbaefccddd1007aa48.jpg",
      like: 899,
      isLiked: true,
      following: 400,
      description:
          "Bún bò Huế là một món ăn đặc sản nổi tiếng của thành phố Huế, Việt Nam. Món ăn này nổi bật với nước dùng đậm đà, có hương vị thơm ngon từ sả, mắm ruốc, và ớt sa tế. Thịt bò mềm, giò heo béo ngậy, và chả cua tạo nên sự đa dạng trong hương vị và kết cấu. Bún bò Huế thường được ăn kèm với rau sống, chanh, và ớt tươi, tạo nên một trải nghiệm ẩm thực đậm đà, cay nồng, đặc trưng của miền Trung Việt Nam.",
      ingredients: """
- 1 kg xương bò (xương ống hoặc xương cổ)
- 500g thịt bò (nạm, gầu, bắp, hoặc gân)
- 1 củ hành tây
- 1 củ gừng
- 5-7 quả hồi
- 1-2 thanh quế
- 3-4 miếng đinh hương
- 1 quả thảo quả (tùy chọn)
- 1 củ cải trắng
- 2-3 nhánh hành lá
- Rau thơm (ngò gai, húng quế, rau mùi)
- 500g bánh phở tươi hoặc khô
- Nước mắm, muối, đường, tiêu, bột ngọt (tùy chọn)
- Giá đỗ, chanh, ớt tươi, và tương ớt để ăn kèm
""",
      cooking: """
1 - Sơ chế và chần thịt

- Bạn bắc lên bếp 1 nồi nước và cho vào nồi hành tím đã đập dập rồi nấu trên bếp ở nhiệt độ cao.

- Khi nước sôi, bạn cho thịt bò và xương heo đã sơ chế vào và chần khoảng 3 phút để loại bỏ mùi hôi. Sau đó, bạn vớt thịt ra và cho ngay vào tô nước lạnh.

2 - Sơ chế các nguyên liệu khác

- Hành tím mua về bạn lột vỏ 3 củ, sau đó rửa sạch và đập dập, 2 củ còn lại thì rửa sạch và để ráo.

- Hành tây cắt bỏ rễ, và rửa sạch. Bạn rửa sạch gừng và để ráo.

- Nướng hành tây, 2 củ hành tím và gừng trên bếp khoảng 2 phút đến khi dậy mùi thơm.

- Bạn cho phần gia vị nấu phở bò vào chảo và rang trên bếp ở nhiệt độ trung bình nhỏ trong 4 phút đến khi dậy mùi thơm. Cho các gia vị vừa rang vào túi lọc có sẵn và cột chặt miệng túi lại.

3 - Nấu nước dùng

- Bạn cho vào nồi 1.5 lít nước cùng thịt bò và xương heo đã chần rồi đậy nắp lại, hầm trong 1 tiếng. Trong lúc hầm nước dùng, bạn thường xuyên mở nắp nồi và hớt sạch bọt để nước dùng được trong hơn nhé!

- Khi nước sôi, bạn cho hành tây, hành tím, gừng đã nướng thơm và túi gia vị nấu phở đã rang vào nồi.

- Tiếp theo, bạn thêm vào nồi 2 muỗng canh đường phèn, 2 muỗng cà phê muối, 1.5 muỗng cà phê bột ngọt, 1.5 muỗng cà phê hạt nêm rồi khuấy đều, nêm nếm lại gia vị cho vừa ăn và nắp lại 3 phút rồi tắt bếp là hoàn thành.

4 - Hoàn thành

- Bạn vớt thịt bò trong nồi nước dùng ra và cắt thành những lát vừa ăn.

- Sau đó, cho bánh phở ra tô, xếp thịt bò lên trên rồi chan nước dùng và thêm ít ớt cắt lát, rau ăn phở như ngò gai, hành lá,... 
""");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(context),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text('Detail'),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Stack(children: [
          Image.network(
            "https://i.pinimg.com/564x/54/05/e2/5405e26766918d16b291b05773557410.jpg",
            height: 300,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.0),
                ),
              ),
              child: const Padding(
                  padding: EdgeInsets.all(8.0), child: LikeInfo(69, true)),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                ),
              ),
              child: const Padding(
                  padding: EdgeInsets.all(8.0), child: FollowInfo(390)),
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
          child: Text(food.description, style: AppText.bodySM),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Nguyên liệu", style: AppText.titleMD),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(food.ingredients),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Cách chế biến", style: AppText.titleMD),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(food.cooking),
              ),
            ]),
          ),
        )
      ]),
    );
  }
}
