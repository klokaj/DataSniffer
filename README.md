# DataSniffer


Wykrywa numer telefonu w stringu wejściowym. 

Numer telefonu aby być poprawnie wykrytym musi być w postaci cccccccccN albo cccBcccBcccN
gdzie C - cyfra, B -  znak biały " " lub "-", N - znak inny niż cyfra.

NumberDetector: 

Wejscia:
      clk		//sygnał zegara
      en		//enable - sygnał uruchomiajający moduł
[7:0] data_in   	//znak wejściowy
	
Wyjścia:
[7:0] data_out		//dana wyjściowa
      write		//sygnał informujący, że dany znak jest częścią numeru telefonu i powinien być zapisany
		  
		  



todo: 
	- testbench napisanego modułu
	- moduł potrzebuje kontrolera, którego zadaniem będzie komunikowanie się z procesorem sprzętowym, włączanie wyłączanie detekcji, 
	  pobieranie danych z fifo, zapisywanie numerów telefonu do fifo, wysyłanie danych do procesora sprzętowego
		
	


