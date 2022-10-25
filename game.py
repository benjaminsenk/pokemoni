import random
import json

games_json = "games.json"

game_won = "W"
game_start = "Z"

# get list of pokemon
with open("pokemoni.json", "r", encoding="utf-8") as dat:
    pokemons = json.load(dat)

all_attributes = {}
for pokemon in pokemons:
    for attribute, attribute_value in pokemon.items():
        if attribute not in all_attributes:
            all_attributes[attribute] = {attribute_value}
        else:
            all_attributes[attribute].add(attribute_value)


# list of available IDs of pokemons. In the beggining all pokemons are in. When a pokemon is not available, 
# it is deleted from the list
pokemon_list = []
for i in range(len(pokemons)):
    pokemon_list.append(i)

pokemon_list1 = pokemon_list.copy()


class Game:
    def __init__(
        self,
        pokemon,
        criterium=None,
        criterium_value=None,
        num_tries=0,
        all_guesses=None,
    ):
        self.pokemon = pokemon
        self.criterium = criterium
        self.criterium_value = criterium_value
        self.num_tries = num_tries
        if all_guesses is None:
            self.all_guesses = []
        else:
            self.all_guesses = all_guesses

    def attributes_leftovers(self):
        leftovers = {}
        for attribute, properties in all_attributes.items():
            possibilities = set()
            for property in properties:
                if (attribute, property) not in self.all_guesses:
                    possibilities.add(property)
            if len(possibilities) > 1:
                leftovers[attribute] = possibilities            
        return leftovers

    @staticmethod
    def new_game():
        global pokemon_list
        pokemon_list = pokemon_list1.copy()
        random_pokemon = random.choice(pokemons)
        return Game(random_pokemon)

    def victory(self):
        return len(pokemon_list) == 1

    def increment_num_attempts(self):
        self.num_tries += 1

    def guess(self, criterium, criterium_value):
        global pokemon_list
        pokemon_list = pokemon_list.copy()
        temp = pokemon_list.copy()
        self.all_guesses.append((criterium, criterium_value))
        if criterium in self.pokemon:
            self.increment_num_attempts()
            if criterium_value == self.pokemon[criterium]:
                self.valid = True
                for i in pokemon_list:
                    other_pokemon = pokemons[i]
                    if criterium_value != other_pokemon[criterium]:
                        temp.remove(i)
            else:
                self.valid = False
                for i in pokemon_list:
                    other_pokemon = pokemons[i]
                    if criterium_value == other_pokemon[criterium]:
                        temp.remove(i)
            pokemon_list = temp.copy()
            if self.victory():
                return game_won


class GuessPokemon:
    def __init__(self, games_file):
        self.games_file = games_file
        self.load_game()

    def get_new_id(self):
        if len(self.games) == 0:
            return 0
        else:
            return max(self.games.keys()) + 1

    def new_game(self):
        id_game = self.get_new_id()
        game = Game.new_game()
        self.games[id_game] = (game, game_start)
        self.save_game()
        return id_game

    def guess(self, id_game, criterium, criterium_value):
        igra, _ = self.games[id_game]
        stanje = igra.guess(criterium, criterium_value)
        self.games[id_game] = (igra, stanje)
        self.save_game()

    def load_game(self):
        with open(self.games_file, "r", encoding="utf-8") as f:
            games_file = json.load(f)
            self.games = {
                int(id_game): (Game(pokemon, all_guesses), stanje)
                for id_game, (pokemon, all_guesses, stanje) in games_file.items()
            }
            # print (games)

    def save_game(self):
        with open(self.games_file, "w", encoding="utf-8") as f:
            games = {
                id_game: (igra.pokemon, igra.all_guesses, stanje)
                for id_game, (igra, stanje) in self.games.items()
            }
            # print (games)
            json.dump(games, f, ensure_ascii=False)