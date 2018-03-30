# Shamir's secret sharing

<p> <b> <i> Primenjena standardna verzija Shamirovog tajnog deljenja i modifikovana verzija na slike u boji. </i> </b> </p>

<p> <b> Problem: </b> <br/>
Slike se koriste za prenos i čuvanje različitih tipova informacija. Postoje različiti scenariji kada vlasnici slika žele da ih zaštite od zlobupotrebe i redistribucije. </p> 
<i> Primeri: </i> 
<ul>
  <li> Medicinski snimci </li>
  <li> Stalitski snimci </li>
  <li> Skice i nacrti u automobilskoj industriji, građevini, itd. </li>
  <li> Formule u farmaceutskoj industriji. </li>
</ul> 
<p> <b> Jedno rešenje: </b> Sačuvati sliku tako da je nečitljiva dok ne dođe do destinacije. Na destinaciji je moguće izvršiti rekonstrukciju i pročitati sliku. </p> 

<hr>
<p> <b> Osnovna ideja </b> </p> 
<i> Cilj je podeliti tajnu S na n delova takvih da: </i>
<ol>
  <li>  Tajna S može se rekonstruisati ako je poznato k ili više delova.  </li>
  <li> Ako je poznato manje od k delova nije moguće rekonstruisati tajnu S.  </li>
</ol>
<p>
  <b>  Ideja: Polinom stepena k-1 određen je sa k tačaka. </b>
</p>

<hr>

<table>
  <tr>
    <th> <b> Algoritam enkripcije (generisanja senki) </b> </th>
    <th> <b> Algoritam dekripcije </b>  </th>
  </tr>
  <tr>
    <td>  
      <i> Opšti postupak </i>
      <img src = "https://github.com/milicat228/Shamir-s-secret-sharing/blob/master/Algoritam/enkripcija.png?raw=true" / > 
    </td>
    <td> 
      <i> Opšti postupak </i>
      <img src = "https://github.com/milicat228/Shamir-s-secret-sharing/blob/master/Algoritam/dekripcija.png?raw=true" / > 
    </td>
  </tr>
  <tr>
    <td> 
      <i> Detaljni postupak </i>
      <img src = "https://github.com/milicat228/Shamir-s-secret-sharing/blob/master/Algoritam/enkripcijaDetaljno.png?raw=true" / > 
    </td>
    <td>  
      <i> Detaljni postupak </i>
      <img src = "https://github.com/milicat228/Shamir-s-secret-sharing/blob/master/Algoritam/dekripcijaDetaljno.png?raw=true" / > 
    </td>
  </tr>
</table>

<hr>
<p> <b> Za više informacija pogledati pdf. </b> </p>


