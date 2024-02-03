import 'package:flutter/material.dart';
import 'package:hexaoxidane_flutter_site/hexaoxidane_flutter_engine/hexaoxidane_flutter_engine.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _email = '';

  late TextEditingController _emailFieldController;

  @override
  void initState() {
    super.initState();

    _emailFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      background: Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: Image.asset('assets/images/skull-2.jpg'),
      ),
      body: PageContentScaffold(
        alignment: PageContentAlignment(
          direction: PageContentDirection.vertical,
        ),
        children: [
          const SizedBox(height: 1200),
          SizedBox(
            width: double.infinity,
            height: 1000,
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text('DOCTOR!', style: TextStyles.title),
                    const SizedBox(height: 20),
                    const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris feugiat sem nec mollis viverra. Vestibulum condimentum nulla in ligula condimentum semper ac et ligula. Duis sit amet gravida dolor. Aenean ultricies pharetra neque at porttitor. Etiam magna urna, vulputate non finibus non, tristique varius metus. Sed libero nunc, facilisis a leo vel, hendrerit efficitur nunc. Nulla lorem sem, lobortis at purus id, cursus tincidunt metus. Praesent eu tempus mauris. Maecenas mi nisl, bibendum et porttitor a, tempus et dolor. Cras pellentesque lectus felis, luctus ullamcorper felis vehicula vitae. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum vel molestie magna. \n \n Integer rhoncus, diam in ultricies efficitur, arcu leo ultrices est, sit amet blandit ex sem eget diam. Praesent commodo diam eget lectus ultricies dictum. Curabitur pharetra pretium finibus. Vestibulum faucibus porttitor augue vel porttitor. Donec tellus velit, euismod ut dolor sit amet, vestibulum imperdiet neque. In porta ante vel eros tincidunt pharetra. Aenean sed ultrices tortor, ut ullamcorper sem. Sed rutrum bibendum nisl ac condimentum.!',
                        style: TextStyles.display),
                    const SizedBox(height: 100),
                    const Text('Stay tuned!', style: TextStyles.heading3),
                    SizedBox(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("X"),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Reddit"),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("YouTube"),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("F95Zone"),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text('Join our maling list?', style: TextStyles.heading3),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 450,
                      child: TextField(
                        controller: _emailFieldController,
                        onChanged: (String text) => _email = text,
                        decoration: const InputDecoration(
                          labelText: 'Email Address',
                          hintText: 'Email Address',
                          filled: true,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Hell yeah!"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
