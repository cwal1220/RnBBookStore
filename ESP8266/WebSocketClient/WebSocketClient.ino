#include <Arduino.h>
#include <time.h>
#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>
#include <WebSocketsClient.h>
#include <Hash.h>
#include <SPI.h>
#include <string.h>
#include "MFRC522.h"


#define RST_PIN  D1  // RST-PIN für RC522 - RFID - SPI - Modul GPIO5 
#define SS_PIN  D8  // SDA-PIN für RC522 - RFID - SPI - Modul GPIO4 
char buf[80];
ESP8266WiFiMulti WiFiMulti;
WebSocketsClient webSocket;

MFRC522 mfrc522(SS_PIN, RST_PIN); // Create MFRC522 instance


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

			break;
		case WStype_BIN:
			USE_SERIAL.printf("[WSc] get binary length: %u\n", length);
			hexdump(payload, length);
			break;
	}

}
void setup() {
	USE_SERIAL.begin(115200);
  pinMode(D3, OUTPUT);
	USE_SERIAL.setDebugOutput(true);
  
  
	for(uint8_t t = 4; t > 0; t--) {
		USE_SERIAL.printf("[SETUP] BOOT WAIT %d...\n", t);
		USE_SERIAL.flush();
		delay(1000);
	}

	WiFiMulti.addAP("ParkChan", "88888888");
  	WiFiMulti.addAP("Kosta_Certi", "kostacerti");
  	WiFiMulti.addAP("U+Net9618", "1157001488");

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

	SPI.begin();           // Init SPI bus
	mfrc522.PCD_Init();    // Init MFRC522
}

void loop() {
	webSocket.loop();

	// Look for new cards
  if ( ! mfrc522.PICC_IsNewCardPresent()) {
    delay(50);
    return;
  }
  // Select one of the cards
  if ( ! mfrc522.PICC_ReadCardSerial()) {
    delay(50);
    return;
  }
  digitalWrite(D3, HIGH);
  String str = getUID(mfrc522.uid.uidByte, mfrc522.uid.size);
  webSocket.sendTXT(str.c_str());
  delay(150);
  digitalWrite(D3, LOW);
  delay(850);
  Serial.println();


}

String getUID(byte *buffer, byte bufferSize) {
  String content= "";
  for (byte i = 0; i < bufferSize; i++) {
    content.concat(String(mfrc522.uid.uidByte[i] < 0x10 ? "0" : ""));
    content.concat(String(mfrc522.uid.uidByte[i], HEX));
  }
  Serial.println(content);
  return content;
}
