#include <Arduino.h>
#include <time.h>
#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>

#include <WebSocketsClient.h>

#include <Hash.h>

char buffer[80];
ESP8266WiFiMulti WiFiMulti;
WebSocketsClient webSocket;

#define USE_SERIAL Serial

void webSocketEvent(WStype_t type, uint8_t * payload, size_t length) {

	switch(type) {
		case WStype_DISCONNECTED:
			USE_SERIAL.printf("[WSc] Disconnected!\n");
			break;
		case WStype_CONNECTED: {
			USE_SERIAL.printf("[WSc] Connected to url: %s\n", payload);

			// send message to server when Connected
			webSocket.sendTXT("Connected");
		}
			break;
		case WStype_TEXT:
			USE_SERIAL.printf("[WSc] get text: %s\n", payload);

			// send message to server
			// webSocket.sendTXT("message here");
			break;
		case WStype_BIN:
			USE_SERIAL.printf("[WSc] get binary length: %u\n", length);
			hexdump(payload, length);

			// send data to server
			// webSocket.sendBIN(payload, length);
			break;
	}

}


void buttonPush()
{
  char temp_buff[80] = {'\0',};
  printLocalTime();
  sprintf(temp_buff, "%s Button Pushed!!", buffer);
  webSocket.sendTXT(temp_buff);
  USE_SERIAL.printf("%s Button Pushed....\n", buffer);
}


void printLocalTime()
{
  time_t rawtime;
  struct tm * timeinfo;

  time (&rawtime);
  timeinfo = localtime (&rawtime);
   strftime(buffer, 80, "[%Y-%m-%d %H:%M:%S]", timeinfo);
}


void setup() {
	USE_SERIAL.begin(115200);
	USE_SERIAL.setDebugOutput(true);
  
  pinMode(0, INPUT_PULLUP);
  attachInterrupt(0, buttonPush, FALLING);
  
	for(uint8_t t = 4; t > 0; t--) {
		USE_SERIAL.printf("[SETUP] BOOT WAIT %d...\n", t);
		USE_SERIAL.flush();
		delay(1000);
	}

	WiFiMulti.addAP("ParkChan", "88888888");
  WiFiMulti.addAP("Kosta_Certi", "kostacerti");

	//WiFi.disconnect();
	while(WiFiMulti.run() != WL_CONNECTED) {
		delay(100);
	}

	// server address, port and URL
	webSocket.begin("49.236.136.179", 8080, "/hehe/broadcasting");

	// event handler
	webSocket.onEvent(webSocketEvent);

	// use HTTP Basic Authorization this is optional remove if not needed
//	webSocket.setAuthorization("user", "Password");

	// try ever 5000 again if connection has failed
	webSocket.setReconnectInterval(5000);

  configTime(0, 32400, "pool.ntp.org");
}

void loop() {
	webSocket.loop();
}
