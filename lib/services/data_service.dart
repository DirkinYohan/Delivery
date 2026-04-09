import 'package:delivery/models/burger.dart';

class DataService {
  static final List<Burger> burgers = [
    Burger(
      id: '1',
      name: "Cheeseburger Wendy's Burger",
      description:
          "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
      price: 8.24,
      rating: "4.9",
      time: "26 mins",
      imagePath: 'assets/images/burger_1.png',
      categories: ['All', 'Classic'],
    ),
    Burger(
      id: '2',
      name: "Hamburger Veggie Burger",
      description:
          "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun.",
      price: 9.99,
      rating: "4.8",
      time: "22 mins",
      imagePath: 'assets/images/burger_2.png',
      categories: ['All', 'Combos'],
    ),
    Burger(
      id: '3',
      name: "Hamburger Chicken Burger",
      description:
          "Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger!",
      price: 12.48,
      rating: "4.6",
      time: "24 mins",
      imagePath: 'assets/images/burger_3.png',
      categories: ['All', 'Sliders'],
    ),
    Burger(
      id: '4',
      name: "Fried Chicken Burger",
      description:
          "Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.",
      price: 14.50,
      rating: "4.5",
      time: "25 mins",
      imagePath: 'assets/images/burger_4.png',
      categories: ['All', 'Classic'],
    ),
    Burger(
      id: '5',
      name: "Ultimate Experience Burger",
      description: "Customize Your Burger to Your Tastes. Ultimate Experience",
      price: 16.49,
      rating: "5.0",
      time: "30 mins",
      imagePath: 'assets/images/burger_5.png',
      categories: ['All', 'Combos'],
    ),
  ];
}
