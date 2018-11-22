#!/bin/bash
RANDOM_NUMBER=$(( ( RANDOM % 10 )  + 1 ))
echo #####################################
echo "Press q to quit anytime."
#echo "Random number: " $RANDOM_NUMBER

while true; do
    read -p "Guess a number between 1 and 10. Your pick: " GUESS
    if [ "$GUESS" == "q" ]; then
        echo "Thank you for playing the game!"
        break
    elif [ "$GUESS" == "$RANDOM_NUMBER" ]; then
        echo "You have guessed the random number. Secret number was: " $RANDOM_NUMBER.
        break
    elif [ "$GUESS" -gt "$RANDOM_NUMBER" ]; then
        echo "You have guessed" $GUESS ". Secret number is lower."
    elif [ "$GUESS" -lt "$RANDOM_NUMBER" ]; then
        echo "You have guessed" $GUESS ". Secret number is higher."
    fi
done
