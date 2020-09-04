# DataSniffer

Wykrywa numer telefonu w stringu wejściowym. 

## NumberDetector: 
<p>
	
Numer telefonu aby być poprawnie wykrytym musi być w postaci cccccccccN albo cccBcccBcccN <br>
Gdzie: 	
	<ol>
		<li> C - cyfra </li>
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
[7:0] data_out		//dana wyjściowa
      write		//sygnał informujący, że dany znak jest częścią numeru telefonu i powinien być zapisany
		  
		  
</p>

### todo 
<p>

	- testbench napisanego modułu
	- moduł potrzebuje kontrolera, którego zadaniem będzie komunikowanie się z procesorem sprzętowym, włączanie wyłączanie detekcji, 
	  pobieranie danych z fifo, zapisywanie numerów telefonu do fifo, wysyłanie danych do procesora sprzętowego
</p>		
	


