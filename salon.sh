#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # Fetch available services from the database
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  
  # Read and display the services in the format: #) <service>
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  # Read the selected service
  read SERVICE_ID_SELECTED

  # Check if the service exists in the database
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  
  if [[ -z $SERVICE_NAME ]]
  then
    # If service doesn't exist, reload the menu with a message
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    # Ask for phone number
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    # Check if the customer already exists
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    if [[ -z $CUSTOMER_NAME ]]
    then
      # Get new customer name if they don't exist
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      # Insert new customer into the database
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
    fi

    # Retrieve the customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # Format the variables to strip out extra whitespace returned by psql tuples-only
    FORMATTED_SERVICE_NAME=$(echo $SERVICE_NAME | sed -E 's/^[[:space:]]+|[[:space:]]+$//g')
    FORMATTED_CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed -E 's/^[[:space:]]+|[[:space:]]+$//g')

    # Ask for the appointment time
    echo -e "\nWhat time would you like your $FORMATTED_SERVICE_NAME, $FORMATTED_CUSTOMER_NAME?"
    read SERVICE_TIME

    # Insert the appointment into the database
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    # Output the final success message
    echo -e "\nI have put you down for a $FORMATTED_SERVICE_NAME at $SERVICE_TIME, $FORMATTED_CUSTOMER_NAME."
  fi
}

MAIN_MENU