/*
 * main.c
 *
 *  Created on: 6 wrz 2020
 *      Author: Krzysztof Lokaj
 */


#include "xparameters.h"
#include "xgpio.h"
#include "xllfifo.h"
#include "xbasic_types.h"
#include "xuartlite.h"





/**************************** user definitions ********************************/
#define CHANNEL 1
#define PACKET_LENGHT 256  //number of bytes in packet

/************************** function prototypes *******************************/
void Xuint32ToString(char str[], Xuint32 dest[], Xuint8 len);
void UART_Init();
int GetText(char* src);
void DataSniffer_Start(void);		//mockups
int DataSniffer_ResultReady(void);


/**************************** global variables ********************************/
XGpio gpio_out;
XLlFifo fifo;
XUartLite uart;
XUartLite_Config uart_config;

int main(){
	//Create variables
	int i = 0;
	int ReceiveLength, TransmitLength;
	char tx_str[PACKET_LENGHT];
	char rx_str[PACKET_LENGHT];
	Xuint32 tx_buff[PACKET_LENGHT >> 2];

	//Initialize peripherials
	XGpio_Initialize(&gpio_out, XPAR_AXI_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirection(&gpio_out, CHANNEL, 0x00);
	XLlFifo_Initialize(&fifo, XPAR_AXI_FIFO_MM_S_0_BASEADDR);
	UART_Init();

	//Get Input string, should be recievied from outside (GPIO, UART, USB, ETHERNET)
	TransmitLength = GetText(&rx_str);

	//Send data to fifo stream
	XLlFifo_Write(&fifo, rx_str, TransmitLength);
	XLlFifo_TxSetLen(&fifo, TransmitLength);

	//Wait for end of transaction
	while(XLlFifo_IsTxDone(&fifo) == 0){}

	//Start data sniffer
	DataSniffer_Start();

	//Wait for end of data sniffer operation
	while( ! DataSniffer_ResultReady()){}

	//Recieve data
	ReceiveLength = XLlFifo_iRxGetLen(&fifo);
	Xuint32 RxWord;
	for ( i=0; i < ReceiveLength; i++){
		RxWord = XLlFifo_RxGetWord(&fifo);
		*(tx_buff + i) = RxWord;
	}

	//Converse data from Xuin32 tab to char tab
	Xuint32ToString(tx_str, tx_buff, ReceiveLength >> 2);

	//Send data via GPIO
	for(i = 0; i < ReceiveLength; i++){
		XGpio_DiscreteWrite(&gpio_out, CHANNEL, tx_str[i]);
	}
	XGpio_DiscreteWrite(&gpio_out, CHANNEL, 0x00);


	//Send data via UART
	for( i = 0; i < ReceiveLength; i= i+10){
		XUartLite_Send(&uart, (tx_str+i), 10);
		while(XUartLite_IsSending(&uart)){}
	}

	while(1){}
}



void UART_Init(void){
	//uart_config.BaudRate = XPAR_AXI_UARTLITE_0_BAUDRATE;
	uart_config.BaudRate = 230400;
	uart_config.DeviceId = XPAR_AXI_UARTLITE_0_DEVICE_ID;
	uart_config.DataBits = XPAR_AXI_UARTLITE_0_DATA_BITS;
	uart_config.ParityOdd = XPAR_AXI_UARTLITE_0_ODD_PARITY;
	uart_config.UseParity = XPAR_AXI_UARTLITE_0_USE_PARITY;
	uart_config.RegBaseAddr =  XPAR_AXI_UARTLITE_0_BASEADDR;

	XUartLite_CfgInitialize(&uart, &uart_config, XPAR_AXI_UARTLITE_0_BASEADDR);
}

void Xuint32ToString(char str[], Xuint32 dest[], Xuint8 len){
	Xuint32 i = 0;
	for(i = 0; i < len; i++){
		str[(i << 2) ] =     (Xuint32)(dest[i]);
		str[(i << 2) + 1 ] = (Xuint32)(dest[i] >> 8);
		str[(i << 2) + 2 ] = (Xuint32)(dest[i] >> 16);
		str[(i << 2) + 3 ] = (Xuint32)(dest[i] >> 24);
	}
}

int GetText(char* src){
	char tx_str[PACKET_LENGHT] = "101 232 232 asddds 999-997-998 "
			"tekst 123456789 z numerem telefonu987654321s kolejn"
			"y444 333 222 asd d 222-332 332 789765 678asd asdasda"
			"sd koniec tekstu raz"
			"zzzzzzzzzz870284592zzzzzzzzzzzzzzzzzzz 730647290 asdda"
			"kkkkkkkkkkkkkkkkkkkk jjjjjj"
			"jjj767 788 721jjjjjjjjjjjjjjjjjjd  sad sd";
	int i = 0;
	for(i = 0; i < PACKET_LENGHT; i++){
		*(src+i) = *(tx_str + i);
	}

	return PACKET_LENGHT;

}


void DataSniffer_Start(void){

	//Pulse start bit in data sniffer ctrl reg
	//DataSniffer_IP_mWriteReg(DATASNIFFER_BASE_ADDR, CTRL_REG_OFFSET, 1);
	//DataSniffer_IP_mWriteReg(DATASNIFFER_BASE_ADDR, CTRL_REG_OFFSET, 0);
	return;
}
int DataSniffer_ResultReady(void){
	//Return ReadyBit from DataSniffer Status register
	//return (DataSniffer_IP_mReadReg(DATASNIFFER_BASE_ADDR, STATUS_REG_OFFSET, 0) & 0x01);
	return 1;
}

