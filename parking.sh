#!/bin/bash

# Number of classrooms and seats
NUM_CLASSROOMS=6
SEATS_PER_CLASSROOM=30

# Total number of parking slots
TOTAL_PARKING_SLOTS=$((NUM_CLASSROOMS * SEATS_PER_CLASSROOM))

# Function to calculate the classroom and seat based on parking slot
calculate_classroom_and_seat() {
    local parking_slot=$1
    local classroom=$(( (parking_slot - 1) / SEATS_PER_CLASSROOM + 1 ))
    local seat=$(( (parking_slot - 1) % SEATS_PER_CLASSROOM + 1 ))
    echo "Parking Slot $parking_slot -> Classroom $classroom, Seat $seat"
}

# Function to take vehicle details and assign parking slot
assign_parking_slot() {
    read -p "Enter the vehicle number: " vehicle_number
    # You can perform additional validation or processing on the vehicle details if needed
    # For now, let's just assign the next available parking slot
    local parking_slot=$((RANDOM % TOTAL_PARKING_SLOTS + 1))
    echo "Vehicle with number $vehicle_number assigned to:"
    calculate_classroom_and_seat $parking_slot
}

# Main script
echo "Welcome to the Training Center Parking System!"

while true; do
    read -p "Do you want to assign a parking slot for a vehicle? (y/n): " choice
    case $choice in
        [Yy]* ) assign_parking_slot;;
        [Nn]* ) echo "Goodbye!"; break;;
        * ) echo "Please enter 'y' or 'n'.";;
    esac
done

