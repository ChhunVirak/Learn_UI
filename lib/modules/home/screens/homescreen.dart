import 'package:change_language/modules/home/screens/screen_detail.dart';
import 'package:change_language/widgets/home/custom_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "News Books",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 25),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailScreen(
                              price: '20',
                              about:
                                  'Hat, ribbon, bird, rose, To the people on the island, a disappeared thing no longer has any meaning. it can be burned in the garden, thrown in the river or handed over to the Memory Police, Soon enough, the island forgets it ever existed. \nWhen a young novelist discovers that her editor iS in danger of being taken away by the Memory Police, she desperately wants to save him.',
                              imgUrl:
                                  'https://m.media-amazon.com/images/M/MV5BMjEwMDA1MDUwNl5BMl5BanBnXkFtZTcwMDQzMzM1MQ@@._V1_.jpg',
                            ),
                          ),
                        );
                      },
                      title: 'Moon Knight',
                      price: "\$200",
                      imgUrl:
                          "https://m.media-amazon.com/images/M/MV5BMjEwMDA1MDUwNl5BMl5BanBnXkFtZTcwMDQzMzM1MQ@@._V1_.jpg",
                    ),
                    const CustomCard(
                      title: 'Hello Man',
                      price: 'Free',
                      imgUrl:
                          "https://m.media-amazon.com/images/M/MV5BMjEwMDA1MDUwNl5BMl5BanBnXkFtZTcwMDQzMzM1MQ@@._V1_.jpg",
                    ),
                    const CustomCard(
                      imgUrl:
                          "https://m.media-amazon.com/images/M/MV5BMjEwMDA1MDUwNl5BMl5BanBnXkFtZTcwMDQzMzM1MQ@@._V1_.jpg",
                    ),
                    const CustomCard(
                      imgUrl:
                          "https://m.media-amazon.com/images/M/MV5BMjEwMDA1MDUwNl5BMl5BanBnXkFtZTcwMDQzMzM1MQ@@._V1_.jpg",
                    ),
                    const CustomCard(
                      imgUrl:
                          "https://m.media-amazon.com/images/M/MV5BMjEwMDA1MDUwNl5BMl5BanBnXkFtZTcwMDQzMzM1MQ@@._V1_.jpg",
                    ),
                    const CustomCard(
                      imgUrl:
                          "https://m.media-amazon.com/images/M/MV5BMjEwMDA1MDUwNl5BMl5BanBnXkFtZTcwMDQzMzM1MQ@@._V1_.jpg",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "For You",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 25),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CustomCard(
                      imgUrl:
                          'https://upload.wikimedia.org/wikipedia/en/1/13/Biriyaani-2020-film-Poster-IMG-20200309-WA0021_resized.jpg',
                    ),
                    CustomCard(
                      imgUrl:
                          'https://upload.wikimedia.org/wikipedia/en/1/13/Biriyaani-2020-film-Poster-IMG-20200309-WA0021_resized.jpg',
                    ),
                    CustomCard(
                      imgUrl:
                          'https://upload.wikimedia.org/wikipedia/en/1/13/Biriyaani-2020-film-Poster-IMG-20200309-WA0021_resized.jpg',
                    ),
                    CustomCard(
                      imgUrl:
                          'https://upload.wikimedia.org/wikipedia/en/1/13/Biriyaani-2020-film-Poster-IMG-20200309-WA0021_resized.jpg',
                    ),
                    CustomCard(
                      imgUrl:
                          'https://upload.wikimedia.org/wikipedia/en/1/13/Biriyaani-2020-film-Poster-IMG-20200309-WA0021_resized.jpg',
                    ),
                    CustomCard(
                      imgUrl:
                          'https://upload.wikimedia.org/wikipedia/en/1/13/Biriyaani-2020-film-Poster-IMG-20200309-WA0021_resized.jpg',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
