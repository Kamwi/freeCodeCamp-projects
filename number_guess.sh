#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=guessing_game -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_DATA=$($PSQL "SELECT username, games_played, best_game FROM players WHERE username='$USERNAME';")

if [[ -z $USER_DATA ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO players(username) VALUES('$USERNAME');" > /dev/null
  GAMES_PLAYED=0
  BEST_GAME=""
else
  IFS='|' read -r USERNAME_DB GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
  echo "Welcome back, $USERNAME_DB! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
GUESSES=0

echo "Guess the secret number between 1 and 1000:"

while true; do
  read GUESS
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi
  ((GUESSES++))
  if (( GUESS < SECRET_NUMBER )); then
    echo "It's higher than that, guess again:"
  elif (( GUESS > SECRET_NUMBER )); then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    if [[ -z $USER_DATA ]]; then
      $PSQL "UPDATE players SET games_played=1, best_game=$GUESSES WHERE username='$USERNAME';" > /dev/null
    else
      NEW_BEST=$BEST_GAME
      if [[ -z $BEST_GAME ]] || (( GUESSES < BEST_GAME )); then
        NEW_BEST=$GUESSES
      fi
      $PSQL "UPDATE players SET games_played=$((GAMES_PLAYED+1)), best_game=$NEW_BEST WHERE username='$USERNAME_DB';" > /dev/null
    fi
    break
  fi
done