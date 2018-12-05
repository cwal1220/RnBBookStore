#include <Arduino.h>
#include <time.h>
#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>
#include <WebSocketsClient.h>
#include <Hash.h>
#include <SPI.h>
#include <string.h>
#include "MFRC522.h"


#define RST_PIN  D1  // RST-PIN for RC522 - RFID - SPI - Modul GPIO5 
#define SS_PIN  D8  // SDA-PIN for RC522 - RFID - SPI - Modul GPIO4 
char buf[80];
ESP8266WiFiMulti WiFiMulti;
WebSocketsClient webSocket;

MFRC522 mfrc522(SS_PIN, RST_PIN); // Create MFRC522 instance


#define USE_SERIAL Serial

void webSocketEvent(WStype_t type, uint8_t * payload, size_t length) {
	switch(type) {
		case WStype_DISCONNECTED: // 연결 해제시
			Serial.printf("[WSc] Disconnected!\n");
			break;
		case WStype_CONNECTED: // 연결 성공시
			Serial.printf("[WSc] Connected to url: %s\n", payload);
			webSocket.sendTXT("Connected");
			break;
		case WStype_TEXT:
			Serial.printf("[WSc] get text: %s\n", payload); // 메시지를 받으면
			break;
		case WStype_BIN: // 2진메세지
			USE_SERIAL.printf("[WSc] get binary length: %u\n", length);
			hexdump(payload, length);
			break;
	}
}
void setup() {
	Serial.begin(115200);
  pinMode(D3, OUTPUT);
	Serial.setDebugOutput(true);


  // Wi-Fi 등록
  WiFiMulti.addAP("ParkChan", "88888888");
  WiFiMulti.addAP("Kosta_Certi", "kostacerti");
  WiFiMulti.addAP("U+Net9618", "1157001488");

  // Wi-Fi 연결 대기
	while(WiFiMulti.run() != WL_CONNECTED) {
		delay(100);
	}

	// 웹소켓 IP, 주소,,,
	webSocket.begin("49.236.136.179", 8080, "/hehe/broadcasting");

	// 웹소켓 이벤트 핸들러 등록
	webSocket.onEvent(webSocketEvent);

  // 웹소켓 인증시 사용됨
//  webSocket.setAuthorization("user", "Password");

  // 5000ms 경과시 재연결 시도
	webSocket.setReconnectInterval(5000);

  // Init SPI bus
	SPI.begin();
  // Init MFRC522
	mfrc522.PCD_Init();    
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
