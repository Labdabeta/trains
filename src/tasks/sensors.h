#ifndef SENSORS_H
#define SENSORS_H

#define NUM_SENSOR_BLOCKS 10

/* Task which maintains the state of the sensors. */
void sensors(void);

void gotSensors(char sensors[NUM_SENSOR_BLOCKS]);

/* Registers your task to be called whenever a sensor is flipped.
 *
 * Whenever a sensor is flipped your task will receive a message containing 1
 * word - the sensor id. Please reply hastily with a zero-sized message.
 * If the word is negative it indicates that the sensor was un-triggered. */
void registerForSensorFlips(int tid);

/* Returns the state of the given sensor. */
int getSensorState(int tid, int id);

/* Translates a group and number into a sensor id. */
static inline int toSensorId(char group, int number)
{
	return ((group - 'A') << 4) + number - 1;
}

/* Translates a sensor id to a group and number. */
static inline void toGroupNumber(int id, char *group, int *number)
{
    if (id < 0) id = -id;
	*group = (id >> 4) + 'A';
	*number = id & 0xF;
}

#endif /* SENSORS_H */
