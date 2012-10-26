/* START:private */
#define INVALID 999999

static int room_temp    = INVALID;
static int desired_temp = INVALID;
static int ac_on        = 0;

static void update_ac() {
    if (room_temp    != INVALID &&
        desired_temp != INVALID) {
        ac_on = (room_temp > desired_temp);
    }
}
/* END:private */


/* START:public */
int ac_is_on() {
    return ac_on;
}

void set_room_temp(int temperature) {
    room_temp = temperature;
    update_ac();
}

void set_thermostat(int temperature) {
    desired_temp = temperature;
    update_ac();
}
/* END:public */
