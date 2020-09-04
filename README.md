# DataSniffer

Wykrywa numer telefonu w stringu wejściowym. 

## NumberDetector: 
<p>
	
Numer telefonu aby być poprawnie wykrytym musi być w postaci cccccccccN albo cccBcccBcccN <br>
Gdzie: 	
	<ol>
		<li> c - cyfra </li>
		<li> B -  znak biały " " lub "-" </li> 
		<li> N - znak inny niż cyfra </li> 
	</ol>
</p>


### Interfejs
<p>

Wejscia:
<ol>
	<li>  clk		--sygnał zegara </li>
	<li>  en		--enable - sygnał uruchomiajający moduł </li>
	<li> [7:0] data_in      --znak wejściowy </li>
</ol>

Wyjścia:
<ol>
	<li>[7:0] data_out	--dana wyjściowa</li>
        <li> write		--sygnał informujący, że dany znak jest częścią numeru telefonu i powinien być zapisany </li>
</ol>
		  
</p>

### todo 
<p>

	- testbench napisanego modułu
	- dodanie Fifo wejściowego / wyjściowgo
	- dodanie kontrolerów fifo 
	- dodanie głównego kontrolera, ktry będzie zarządzał pracą całego modułu i komunikował się z ARM
</p>		
	


