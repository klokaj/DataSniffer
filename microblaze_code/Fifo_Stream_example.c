/*
 * main.c
 *
 *  Created on: 6 wrz 2020
 *      Author: Krzysztof Lokaj
 */


#include "xparameters.h"
#include "xgpio.h"
#include "xllfifo.h"

/**************************** user definitions ********************************/
#define CHANNEL 1


XGpio gpio_out;
XLlFifo fifo;
//XLlFifo_Config fifo_config;



int main(){


	//u32 data;
	//u8 din, dout, ctrl;
	char tab[25] = "example string - 997 223 123";

	char rx[10];

	XGpio_Initialize(&gpio_out, XPAR_AXI_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirection(&gpio_out, CHANNEL, 0x00);
	XGpio_DiscreteWrite(&gpio_out, CHANNEL, 0x00);

	XGpio_DiscreteWrite(&gpio_out, CHANNEL, 0xff);
	XGpio_DiscreteWrite(&gpio_out, CHANNEL, 0x00);
	XGpio_DiscreteWrite(&gpio_out, CHANNEL, 0xff);
	XGpio_DiscreteWrite(&gpio_out, CHANNEL, 0x00);



	XLlFifo_Initialize(&fifo, XPAR_AXI_FIFO_MM_S_0_BASEADDR);
	XLlFifo_Write(&fifo, tab, 25);
	XLlFifo_TxSetLen(&fifo, 25);
	while(XLlFifo_IsTxDone(&fifo) == 0){
		XGpio_DiscreteWrite(&gpio_out, CHANNEL, 0xff);
	}

	XGpio_DiscreteWrite(&gpio_out, CHANNEL, 0x00);

	while(XLlFifo_RxGetLen(&fifo) < 10){
		XGpio_DiscreteWrite(&gpio_out, CHANNEL, 0xf0);
		XGpio_DiscreteWrite(&gpio_out, CHANNEL, 0x0f);
		XGpio_DiscreteWrite(&gpio_out, CHANNEL, 0xf0);
		XGpio_DiscreteWrite(&gpio_out, CHANNEL, 0x0f);
	}
	XLlFifo_Read(&fifo, rx, 10);

	int i =0;
	for( i =0 ; i < 10; i++){
		XGpio_DiscreteWrite(&gpio_out, CHANNEL, rx[i]);
	}




	XGpio_DiscreteWrite(&gpio_out, CHANNEL, 0xff);
	XGpio_DiscreteWrite(&gpio_out, CHANNEL, 0x00);
	XGpio_DiscreteWrite(&gpio_out, CHANNEL, 0xff);
	XGpio_DiscreteWrite(&gpio_out, CHANNEL, 0x00);







	return 0;





}









