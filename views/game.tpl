% import game
% rebase('base.tpl')

<div class="bg">
<table>
     <caption><h2>NAJDI POKEMONA</h2></caption>
    <tr>
    % i = 0
    % while i < 5:
    % if i in game.pokemon_list:
    % picture = "../img/"+str(i) + ".png"
    <th><img src="{{picture}}" width="116" height="116"></th>
    % else:
    % picture = "../img/x"+str(i)+".png"
    <th><img src="{{picture}}" width="116" height="116"></th>
    % end
    % i = i + 1
    % end
    </tr>
    
    <tr>
    % i = 5
    % while i <= 9:
    % if i in game.pokemon_list:
    % picture = "../img/"+str(i)+".png"
    <th><img src="{{picture}}"  width="116" height="116"></th>
    % else:
    % picture = "../img/x"+str(i)+".png"
    <th><img src="{{picture}}"  width="116" height="116"></th>
    % end
    % i = i + 1
    % end
    </tr>

    <tr>
    % i = 10
    % while i <= 14:
    % if i in game.pokemon_list:
    % picture = "../img/"+str(i)+".png"
    <th><img src="{{picture}}"  width="116" height="116"></th>
    % else:
    % picture = "../img/x"+str(i)+".png"
    <th><img src="{{picture}}"  width="116" height="116"></th>
    % end
    % i = i + 1
    % end
    </tr>

    <tr>
    % if stanje == game.game_won:
    <td colspan="7"; style="text-align:center;">
    <p>Čestitam. Uspelo ti je. Tvoj pokemon je {{ igra.pokemon['ime'] }}. Ugotovil si v {{ igra.num_tries }} poskusih.</p>

    <form action="/new_game/" method="post">
        <button type="submit"; style="background-color:#ea8b8b; border-color:#C77575; 
        color:white; font-size: 16px; font-family: Arial, Helvetica, 
        sans-serif; padding: 5px;">Nova igra</button>
      </form>
    % else:
    <td colspan="3"; style="text-align:center;">
        <form action="/game/"; method="POST">
            <select name="vrednost">
            % for atribut, vrednosti in atributi.items():
            <optgroup label="{{atribut}}">
              % for vrednost in vrednosti:
              <option value="{{atribut}}:{{vrednost}}">{{ vrednost }}</option>
              % end
            </optgroup>
            % end
        </optgroup>
        </select>
            <button type="submit" name="kriterij"; style="background-color:#ea8b8b; border-color:#C77575;
            color:white; font-size: 16px; font-family: Arial, Helvetica,
            sans-serif; padding: 5px;">Ugibaj</button>
        </form>
        <td colspan="3"; style="text-align:center;">
          <p>Število poskusov: {{igra.num_tries}} </p>
        <td>
        <tr>
        <td colspan="7"; style="text-align:center;">
        % if igra.num_tries != 0:
          % if igra.valid:
          <p>Izbrani pokemon <u>ima</u> to lastnost.</p>
          % else:
          <p>Izbrani pokemon <u>nima</u> te lastnosti.</p>
          % end
        % else:
        <p></p>
        % end
        </td>
        </tr>
      % end
      </td>

    </tr>
</table>
</div>