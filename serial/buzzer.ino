/* START:defs */
#include <Bounce.h>

const int BUTTON1 = 2;
const int BUTTON2 = 3;
const int LED1    = 9;
const int LED2    = 10;

Bounce button1(BUTTON1, 100);
Bounce button2(BUTTON2, 100);
/* END:defs */

/* START:protocol */
#define QUERY   '?'
#define PLAYER1 '1'
#define PLAYER2 '2'
#define BOTH    'B'
#define NONE    -1

int winner = NONE;
/* END:protocol */

/* START:setup */
void setup() {
    pinMode(BUTTON1, INPUT);
    pinMode(BUTTON2, INPUT);
    pinMode(LED1,    OUTPUT);
    pinMode(LED2,    OUTPUT);

    Serial.begin(9600);
}
/* END:setup */

/* START:button */
int readButtons() {
    button1.update();
    button2.update();
    int b1Pressed = button1.risingEdge();
    int b2Pressed = button2.risingEdge();

    return b1Pressed ?
               (b2Pressed ? BOTH    : PLAYER1) :
               (b2Pressed ? PLAYER2 : NONE);
}
/* END:button */

/* START:setWinner */
void setWinner(int value) {
    winner = value;
    digitalWrite(LED1, (winner == PLAYER1 || winner == BOTH));
    digitalWrite(LED2, (winner == PLAYER2 || winner == BOTH));
}
/* END:setWinner */

/* START:loop */
void loop() {
    int button = readButtons();
    int serial = (Serial.available() > 0 ? Serial.read() : NONE);
    int event  = (button != NONE ? button : serial);

    switch (event) {
    case PLAYER1:
    case PLAYER2:
    case BOTH:
        if (winner == NONE) setWinner(event);
        break;
    case QUERY:
        Serial.write(winner);
        break;
    default:
        break;
    }

    delay(50);
}
/* END:loop */

