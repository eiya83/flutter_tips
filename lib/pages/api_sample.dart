import 'package:flutter/material.dart';
import 'package:flutter_tips/models/pokemon.dart';
import 'package:provider/provider.dart';
import '../notifier/poke_notifier.dart';
import '../widget/bottomNavigation.dart';
import '../widget/pokemon_list_item.dart';

class ApiSamplePage extends StatefulWidget {
  const ApiSamplePage({Key? key}) : super(key: key);

  @override
  State<ApiSamplePage> createState() => _ApiSamplePageState();
}

class _ApiSamplePageState extends State<ApiSamplePage> {

  int currentbnb = 0;

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
      body: SafeArea(
        child: currentbnb == 0 ? const PokeList() : const Settings(),
      ),
      bottomNavigationBar: BottomNavi(onTap: (index) {
        setState(() => currentbnb = index);
      }),
    );
  }
}

// tips:メインのリストVIEW
class PokeList extends StatelessWidget {
  const PokeList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonsNotifier>(
      builder: (context, pokes, child) => ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          itemCount: 9,
          itemBuilder: (context, index) {
            return PokeListItem(
              poke: pokes.byId( index + 1 ),
            );
          }),
    );
  }
}

// tips:setting
class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.lightbulb),
          title: Text('Dark/Light Mode'),
        ),
      ],
    );
  }
}
