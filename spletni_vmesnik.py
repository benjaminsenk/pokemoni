import bottle
import game

SECRET = "my deep secret"
COOKIE = "idigre"

guesspokemon = game.GuessPokemon(game.games_json)


@bottle.get("/")
def index():
    return bottle.template("views/index.tpl")


@bottle.post("/new_game/")
def new_game():
    id_game = guesspokemon.new_game()
    bottle.response.set_cookie(COOKIE, str(id_game), path="/", secret=SECRET)
    bottle.redirect("/game/")


@bottle.get("/game/")
def show_game():
    id_game = int(bottle.request.get_cookie(COOKIE, secret=SECRET))
    igra, stanje = guesspokemon.games[id_game]
    return bottle.template("views/game.tpl", igra=igra, stanje=stanje, atributi=igra.attributes_leftovers())

@bottle.post("/game/")
def guess():
    id_game = int(bottle.request.get_cookie(COOKIE, secret=SECRET))
    [criterium, criterium_value] = bottle.request.forms.getunicode("vrednost").split(":")
    guesspokemon.guess(id_game, criterium, criterium_value)
    bottle.redirect("/game/")

@bottle.get("/img/<picture>")
def show_pokemon(picture):
    return bottle.static_file(picture, root="img")

bottle.run(reloader=True, host="localhost", port=8080, debug=True)
