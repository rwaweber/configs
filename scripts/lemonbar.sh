#!/bin/bash

#define the clock
Clock() {
	DATE=$(date "+%a %b %d, %T")

	echo -n "$DATE"
}
Workspace() {
	workspace = $()

}

Battery() {
	BATPERC=$(acpi --battery | awk '{print $5}')
	echo "$BATPERC"
}
Test() {
	echo "cats!"
}

#print the clock
while true; do
	echo "%{B#c0303048}$(Clock) %{B-}%{c} $(Test) %{r}%{B#c0303048} $(Battery) %{B-}"
	sleep 1;
done
