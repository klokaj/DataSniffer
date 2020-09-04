# DataSniffer

Wykrywa numer telefonu w stringu wejściowym. 
## Interfejs
<p>
	
Numer telefonu aby być poprawnie wykrytym musi być w postaci cccccccccN albo cccBcccBcccN <br>
Gdzie: 	
	<ol>
		<li> C - cyfra </li>
		<li> B -  znak biały " " lub "-" </li> 
		<li> N - znak inny niż cyfra </li> 
	</ol>
</p>

<p>
## NumberDetector: 

Wejscia:
      clk		//sygnał zegara
      en		//enable - sygnał uruchomiajający moduł
[7:0] data_in   	//znak wejściowy
	
Wyjścia:
[7:0] data_out		//dana wyjściowa
      write		//sygnał informujący, że dany znak jest częścią numeru telefonu i powinien być zapisany
		  
		  
</p>

<p>
## todo: 
	- testbench napisanego modułu
	- moduł potrzebuje kontrolera, którego zadaniem będzie komunikowanie się z procesorem sprzętowym, włączanie wyłączanie detekcji, 
	  pobieranie danych z fifo, zapisywanie numerów telefonu do fifo, wysyłanie danych do procesora sprzętowego
</p>		
	


