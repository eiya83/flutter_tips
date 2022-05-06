import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApiSamplePage extends StatefulWidget {
  const ApiSamplePage({Key? key}) : super(key: key);

  @override
  State<ApiSamplePage> createState() => _ApiSamplePageState();
}

class _ApiSamplePageState extends State<ApiSamplePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('api sample'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => PokeListItem(index:index)
      ),
    );
  }
}

class PokeListItem extends StatelessWidget {
  const PokeListItem({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 80,
        decoration: BoxDecoration(
          color: Colors.yellow.withOpacity(.5),
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
            ),
          ),
        ),
      ),
      title: const Text(
        'Pikachu',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: const Text(
        '⚡️electric',
      ),
      trailing: const Icon(Icons.navigate_next),
      onTap: () => {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (BuildContext context) => const PokeDetail(),
        //   ),
        // ),
      },
    );
  }
}