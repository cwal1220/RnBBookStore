#include <Arduino.h>
#include <time.h>
#include <ESP8266WiFi.h>
//#include <ESP8266WiFiMulti.h>
#include <WebSocketsClient.h>
#include <Hash.h>
#include <SPI.h>
#include <string.h>
#include "MFRC522.h"
#include <EEPROM.h>
#include <ESP8266mDNS.h>
#include <DNSServer.h>
#include <ESP8266WebServer.h>


#define EEPROM_LENGTH 1024
#define RST_PIN  D1  // RST-PIN for RC522 - RFID - SPI - Modul GPIO5 
#define SS_PIN  D8  // SDA-PIN for RC522 - RFID - SPI - Modul GPIO4 
#define BUZZER D2

// Captive
WiFiClient espClient;
const byte DNS_PORT = 53;
IPAddress apIP(192, 168, 1, 1);
DNSServer dnsServer;
ESP8266WebServer webServer(80);

// Web Socket
//ESP8266WiFiMulti WiFiMulti;
WebSocketsClient webSocket;

String responseHTML = ""
    "<!DOCTYPE html><html><head><title>RFID Reader Setting Page</title></head><body><center>"
    "<p>RFID Reader Setting Page</p>"
    "<form action='/button'>"
    "<p><input type='text' name='ssid' placeholder='SSID' onblur='this.value=removeSpaces(this.value);'></p>"
    "<p><input type='text' name='password' placeholder='WLAN Password'></p>"
    "<p><input type='submit' value='Submit'></p></form>"
    "<p>Input Wi-Fi SSID and PASSWD</p></center></body>"
    "<script>function removeSpaces(string) {"
    "   return string.split(' ').join('');"
    "}</script></html>";

// EEPROM Datas
char eRead[30];
byte len;
char ssid[30];
char password[30];
bool captive = true;

MFRC522 mfrc522(SS_PIN, RST_PIN); // Create MFRC522 instance

// 웹소켓 핸들러 함수
void webSocketEvent(WStype_t type, uint8_t * payload, size_t length) {
	switch(type) {
		case WStype_DISCONNECTED: // 연결 해제시
			Serial.printf("[WSc] Disconnected!\n");
      beep(2);
			break;
		case WStype_CONNECTED: // 연결 성공시
			Serial.printf("[WSc] Connected to url: %s\n", payload);
			webSocket.sendTXT("Connected");
      beep(3);
			break;
		case WStype_TEXT:
			Serial.printf("[WSc] get text: %s\n", payload); // 메시지를 받으면
			break;
		case WStype_BIN: // 2진메세지
			Serial.printf("[WSc] get binary length: %u\n", length);
			hexdump(payload, length);
			break;
	}
}

void setup() {
  // Testing serial init
	Serial.begin(115200);
 
  // EEPROM 초기화
  EEPROM.begin(EEPROM_LENGTH);
  
  // Buzzer Init
  pinMode(BUZZER, OUTPUT);

  // FLASH 버튼 -> 초기화
  pinMode(0, INPUT_PULLUP);
  attachInterrupt(0, initDevice, FALLING);


  // 데이터를 읽어서 eRead에 저장
  ReadString(0, 30);
  // EEPROM에 데이터가 없으면 Captive(AP-Mode)
  if (!strcmp(eRead, ""))
  {
    setup_captive();
    return;
  }
  
  // EEPROM에서 데이터를 읽어서 저장
  captive = false;
  strcpy(ssid, eRead);
  ReadString(30, 30);
  strcpy(password, eRead);
  
  setup_runtime();  

  // Wi-Fi 등록
//  WiFiMulti.addAP("ParkChan", "88888888");
//  WiFiMulti.addAP("Kosta_Certi", "kostacerti");
//  WiFiMulti.addAP("U+Net9618", "1157001488");

  // Wi-Fi 연결 대기
//	while(WiFiMulti.run() != WL_CONNECTED) {
//		delay(100);
//	}

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
  // Captive(AP-Mode)인 경우
  if (captive)
  {
    dnsServer.processNextRequest();
    webServer.handleClient();
    return;
  }

  // Station 인 경우
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
  String str = getUID(mfrc522.uid.uidByte, mfrc522.uid.size);
  webSocket.sendTXT(str.c_str());
  beep(1);
  delay(850);
  Serial.println();


}

// get UID by Card
String getUID(byte *buffer, byte bufferSize) {
  String content= "";
  for (byte i = 0; i < bufferSize; i++) {
    content.concat(String(mfrc522.uid.uidByte[i] < 0x10 ? "0" : ""));
    content.concat(String(mfrc522.uid.uidByte[i], HEX));
  }
  Serial.println(content);
  return content;
}

// beep beep!
void beep(int count)
{
  for(int i=0; i<count; i++)
  {
    digitalWrite(BUZZER, HIGH);
    delay(100);
    digitalWrite(BUZZER, LOW);
    delay(100);
  }
}

void setup_captive() {    
  WiFi.mode(WIFI_AP);
  WiFi.softAPConfig(apIP, apIP, IPAddress(255, 255, 255, 0));
  WiFi.softAP("RFID_READER");
  dnsServer.start(DNS_PORT, "*", apIP);
  webServer.on("/button", button);
  webServer.onNotFound([]() {
    webServer.send(200, "text/html", responseHTML);
  });
  webServer.begin();
  Serial.println("Captive Portal Started");
}

// Web에서 Submit 버튼 클릭
void button()
{
  Serial.println("Submit Button!");
  SaveString( 0, (webServer.arg("ssid")).c_str());
  SaveString(30, (webServer.arg("password")).c_str());
  webServer.send(200, "text/plain", "OK");
  ESP.restart();
}

// EEPROM에 데이터를 저장
void SaveString(int startAt, const char* id) 
{ 
  for (byte i = 0; i <= strlen(id); i++)
    EEPROM.write(i + startAt, (uint8_t) id[i]);
  EEPROM.commit();
}

// EEPROM에서 데이터를 읽어옴
void ReadString(byte startAt, byte bufor) 
{
  for (byte i = 0; i <= bufor; i++) {
    eRead[i] = (char)EEPROM.read(i + startAt);
  }
  len = bufor;
}

// EEPROM 초기화
void initDevice() {
    Serial.println("Flushing EEPROM....");
    SaveString(0, "");
    ESP.restart();
}


void setup_runtime() {
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  Serial.println("");

  // Wait for connection
  int i = 0;
  while (WiFi.status() != WL_CONNECTED) 
  {
    delay(500);
    Serial.print(".");
    yield;
    if(i++ > 30) 
    {
      ESP.restart();
      return; 
    }
  }
  Serial.println("");
  Serial.print("Connected to "); Serial.println(ssid);
  Serial.print("IP address: "); Serial.println(WiFi.localIP());

  if (MDNS.begin("Doraemon_Gyro")) {
   Serial.println("MDNS responder started");
  }
  
    webServer.onNotFound(handleNotFound);
  webServer.begin();
  Serial.println("HTTP server started");  
}

void handleNotFound()
{
  String message = "File Not Found\n";
  webServer.send(404, "text/plain", message);
}


