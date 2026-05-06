#!/bin/bash

# To define the PSQL variable for querying the database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Random number generator
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Prompt for username
echo Enter your username:
read USERNAME

# Query database for the user
USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

# Check if user exists
if [[ -z $USER_INFO ]]
then
  # New User
  echo Welcome, $USERNAME! It looks like this is your first time here.
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
else
  # Returning user
  IFS="|" read GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

# And the game begins
echo Guess the secret number between 1 and 1000:
read GUESS
GUESS_COUNT=1

# The guessing loop
while [[ $GUESS != $SECRET_NUMBER ]]
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
  read GUESS
  ((GUESS_COUNT++))
done

# calculate updated game stats
GAMES_PLAYED=$((GAMES_PLAYED + 1))

if [[ -z $BEST_GAME || $GUESS_COUNT -lt $BEST_GAME ]]
then
  BEST_GAME=$GUESS_COUNT
fi

# update user stats
UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME'")

# when number guessed
echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"