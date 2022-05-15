import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../models/pokemon.dart';
import '../const.dart';
import 'package:http/http.dart' as http;

class PokemonsNotifier extends ChangeNotifier {
  final Map<int, Pokemon?> _pokeMap = {};

  Map<int, Pokemon?> get pokes => _pokeMap;

  void addPoke(Pokemon poke) {
    _pokeMap[poke.id] = poke;
    notifyListeners();
  }

  void fetchPoke(int id) async {
    _pokeMap[id] = null;
    addPoke(await fetchPokemon(id));
  }

  Pokemon? byId(int id) {
    if (!_pokeMap.containsKey(id)) {
      fetchPoke(id);
    }
    return _pokeMap[id];
  }

  // tips:API実行用関数
  Future<Pokemon> fetchPokemon(int id) async {
    final res = await http.get(
        Uri.parse('$pokeApiRoute/pokemon/$id'),
        // headers: <String, String>{
        //   'Content-Type': 'application/json',
        //   'Access-Control-Allow-Origin': '*'
        // }
    );
    if (res.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to Load Pokemon');
    }
  }
}