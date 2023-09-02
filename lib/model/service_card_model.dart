class ServiceItems {
  final String imageUrl;
  final String iconImage;
  final String iconText;
  final String des1;
  final String des2;
  final String des3;
  final String des4;
  ServiceItems(
      {required this.iconImage,
      required this.iconText,
      required this.des1,
      required this.des2,
      required this.des3,
      required this.des4,
      required this.imageUrl});
}

final List<ServiceItems> serviceItems = [
  ServiceItems(
    imageUrl: 'assets/pexels-cup-of-couple-8015154 1.png',
    iconImage: 'assets/Signature Badge 2.png',
    iconText: 'Signature',
    des1: 'High Quality Disposable Cutlery',
    des2: 'Elegant Decorations & Table Settings',
    des3: 'Served by Waitstaff',
    des4: 'Best for Weddings, Corporate Events',
  ),

  ServiceItems(
    imageUrl: 'assets/0721ca0f425b50d3d8533225b10a2d16.jpg',
    //iconImage: 'assets/a1c6ee70c31efebf77ad04823e692da6.png',
    iconImage: 'assets/Green Badge 2.png',
    iconText: 'Value',
    des1: 'Disposable Cutlery',
    des2: 'Basic Decorations & Table Settings',
    des3: 'Served in Buffet Style',
    des4: 'Best for Birthdays, Family...',
  ),

  ServiceItems(
    imageUrl: 'assets/c233a49264043036c015a76356d31e4f.jpg',
    iconImage: 'assets/7f26cd258a510fb20971538227c22d73.png',
    iconText: 'Luxury',
    des1: 'High End Reusable Cutlery',
    des2: 'Elegant Decorations & Table Settings',
    des3: 'Served by Professional Waitstaff',
    des4: 'Best for Celebrity Parties,Political..',
  ),
  // Add more items as needed
];
