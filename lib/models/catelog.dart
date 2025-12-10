class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });
}

class CatelogModel {
  static final items = [
    Item(
      id: 1,
      name: "XYZ name",
      desc: "XYZ description sbdkvks",
      price: 999,
      color: '#33505a',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmDpdESZq-3Wpj65-s4kbDNMSKFbW5eJUY2Q&s',
    ),
  ];
}
