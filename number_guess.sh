#!/bin/bash

# psql variable
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Enter your username
echo Enter your username:
read USER

# check for existing user
CHECK_USER=$($PSQL "SELECT username FROM users WHERE username = '$USER'")

# if exists get stats and welcome, elif create new user
if [[ -n $CHECK_USER ]]
then
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USER'")
      USER_GAMES=$($PSQL "SELECT COUNT(user_id) FROM games WHERE user_id = $USER_ID")
      USER_BEST=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id = $USER_ID")
      echo "Welcome back, $CHECK_USER! You have played $USER_GAMES games, and your best game took $USER_BEST guesses."
      
      elif [[ -z $CHECK_USER ]]
      then
            NEW_USER=$($PSQL "INSERT INTO users(username) VALUES ('$USER')")
            echo "Welcome, $USER! It looks like this is your first time here."
fi

# create rand number variable 1-1000 and prompt for guess
NUM=$((1 + $RANDOM % 1000))

echo Guess the secret number between 1 and 1000:
read GUESS

# create new game if guess is made
if [[ -n $GUESS ]]
then          
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USER'")
      NEW_GAME=$($PSQL "INSERT INTO games(user_id, guesses) VALUES ($USER_ID, 0)")
	CURRENT_GAME=$($PSQL "SELECT MAX(game_id) FROM games WHERE user_id = $USER_ID")
fi

COUNT=1

# loop guesses until correct
while [[ $GUESS -ne $NUM ]]
do

COUNT=$(($COUNT + 1))

      if [[ ! $GUESS =~ ^[0-9]+$ ]]
      then                         
            echo "That is not an integer, guess again:"
            read GUESS
      
            elif [[ $GUESS -gt $NUM ]]
            then        
                  echo "It's lower than that, guess again:"
                  read GUESS

            else                  
                  echo "It's higher than that, guess again:"
                  read GUESS
      fi
done

# add final guess and congratulate
CURRENT_GAME=$($PSQL "SELECT MAX(game_id) FROM games WHERE user_id = $USER_ID")
INSERT_GUESSES=$($PSQL "UPDATE games SET guesses = $COUNT WHERE game_id = $CURRENT_GAME")
echo "You guessed it in $COUNT tries. The secret number was $NUM. Nice job!"
