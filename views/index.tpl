% import game
% rebase('base.tpl')

<div class="bg">
<table>
     <caption><h2>NAJDI POKEMONA</h2></caption>
    <tr>
        <th><img src="../img/0.png" width="116" height="116" alt="Lena"></th>
        <th><img src="../img/1.png" width="116" height="116" alt="Vilma"></th>
        <th><img src="../img/2.png" width="116" height="116" alt="Michael"></th>
        <th><img src="../img/3.png" width="116" height="116" alt="Robert"></th>
        <th><img src="../img/4.png" width="116" height="116" alt="Martina"></th>
        
    </tr>
    <tr>
        <th><img src="../img/5.png" width="116" height="116" alt="Hans"></th>
        <th><img src="../img/6.png" width="116" height="116" alt="Hanna"></th>
        <th><img src="../img/7.png" width="116" height="116" alt="Ludo"></th>
        <th><img src="../img/8.png" width="116" height="116" alt="Tilman"></th>
        <th><img src="../img/9.png" width="116" height="116" alt="Ina"></th>
       
        
    </tr>
    <tr>
        <th><img src="../img/10.png" width="116" height="116" alt="Brigitte"></th>
        <th><img src="../img/11.png" width="116" height="116" alt="Frank"></th>
        <th><img src="../img/12.png" width="116" height="116" alt="Karl"></th>
        <th><img src="../img/13.png" width="116" height="116" alt="Erika"></th>
        <th><img src="../img/14.png" width="116" height="116" alt="Ludo"></th>
    </tr>
    <tr>
      <th style="padding-left:50px;">
      <form action="/new_game/" method="post">
        <button type="submit"; style="background-color:#ea8b8b; border-color:#C77575; 
        color:white; font-size: 16px; font-family: Arial, Helvetica, 
        sans-serif; padding: 5px;">Nova igra</button>
      </form>
      </th>
    </tr>
    </tr>
      <td colspan="7"; style="text-align:left; padding-left:100px;">
      <p>
        Ko pritisnete gumb nova igra, vam bo računalnik naključno izbral enega izmed zgornjih pokemonov.<br>
        Cilj igre je, v čim manj poskusih ugotoviti katerega pokemona je računalnik izbral.<br>
        Ugibate tako, da izbirate lastnosti iz spustnega seznama. <br>
        Če lastnost uganete bo računalnik prečrtal pokemona, brez te lastnosti.<br>
        Če izberete napačno lastnost, pa bo prečtral ospokemonaebe s to lastnostjo.<br>
        Ko ostane le še en neprečrtan pokemon se igra zaključi.<br>
        Pri igranju vam želim veliko zabave in uspeha. 
      </p>
      </td>
</table>
</div>