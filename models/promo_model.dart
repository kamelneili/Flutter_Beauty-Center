import 'package:equatable/equatable.dart';

class Promo extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  Promo({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });
  @override
  List<Object?> get props => [id, title, imageUrl, description];
  static List<Promo> promos = [
    Promo(
      description: 'Hair beauty',
      id: 1,
      title: 'Hair beauty',
      imageUrl:
          'https://images.unsplash.com/photo-1580618672591-eb180b1a973f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80', //  tags: ['Italian', 'Dessert', 'Ice Cream'],
    ),
    Promo(
        description: 'Color Hair',
        id: 2,
        title: 'Color Hair',
        imageUrl:
            'https://images.unsplash.com/photo-1470259078422-826894b933aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80'),
  ];
}
