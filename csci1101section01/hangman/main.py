import re

# Get answer.
answer = "What's Up, Doc?"

answer = answer.upper()

answer_guessed = []

# Determine whether characters in the answer needs to be guessed.
for answer_character in answer:
  if re.search("^[A-Z]$", answer_character):
    answer_guessed.append(False)
  else:
    answer_guessed.append(True)

# Game logic.
guessed_letters = []
TOTAL_NUM_OF_INCORRECT_GUESSES_ALLOWED = 5
num_of_incorrect_guesses = 0

while num_of_incorrect_guesses < TOTAL_NUM_OF_INCORRECT_GUESSES_ALLOWED and False in answer_guessed:
  print("-------------------------------")
  print("Letters guessed: ", end = "")

  for current_guessed_letter in guessed_letters:
    print(f"{current_guessed_letter} ", end = "")

  print()

  print(f"Number of incorrect guesses remaining: {TOTAL_NUM_OF_INCORRECT_GUESSES_ALLOWED - num_of_incorrect_guesses}")

  print()

  for answer_index in range(len(answer)):
    if answer_guessed[answer_index]:
      print(answer[answer_index], end = "")
    else:
      print("_", end = "")

  print()
  print()

  letter = input("Enter a letter: ")

  letter = letter.upper()

  if letter not in guessed_letters and len(letter) == 1 and re.search("^[A-Z]$", letter):
    # Process the letter in the puzzle.
    guessed_letters_insert_index = 0

    for current_guessed_letter in guessed_letters:
      if letter < current_guessed_letter:
        break

      guessed_letters_insert_index += 1

    guessed_letters.insert(guessed_letters_insert_index, letter)

    if letter in answer:
      # Letter is in the puzzle.
      for answer_index in range(len(answer)):
        if letter == answer[answer_index]:
          answer_guessed[answer_index] = True
    else:
      # Letter is not in the puzzle.
      num_of_incorrect_guesses += 1

# Post-game summary.
print()

if num_of_incorrect_guesses < TOTAL_NUM_OF_INCORRECT_GUESSES_ALLOWED:
  print("Congratulations, you solved the puzzle!")
else:
  print("Sorry, you ran out of guesses.")

print()

print(f"{answer} is the answer to the puzzle.")