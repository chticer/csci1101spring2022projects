import re

# Answer of puzzle.
answer = "What's up, Doc?"

answer = answer.upper()

guessed_answer = []

# Determine if the character in the answer needs to be guessed.
for answer_character in answer:
  if re.search("^[A-Z]$", answer_character):
    guessed_answer.append(False)
  else:
    guessed_answer.append(True)

# Game logic.
TOTAL_NUM_OF_INCORRECT_GUESSES_ALLOWED = 5
num_of_incorrect_guesses = 0
guessed_letters = []

# Playing the game inside the while loop.
while num_of_incorrect_guesses < TOTAL_NUM_OF_INCORRECT_GUESSES_ALLOWED and False in guessed_answer:
  print("-----------------------------------")
  print("Guessed letters: ", end = "")

  for current_guessed_letter in guessed_letters:
    print(f"{current_guessed_letter} ", end = "")

  print()

  print(f"Number of incorrect guesses remaining: {TOTAL_NUM_OF_INCORRECT_GUESSES_ALLOWED - num_of_incorrect_guesses}")

  print()

  for answer_index in range(len(answer)):
    if guessed_answer[answer_index]:
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
      # The letter guessed is in the puzzle.
      for answer_index in range(len(answer)):
        if letter == answer[answer_index]:
          guessed_answer[answer_index] = True
    else:
      # The letter guessed is not in the puzzle.
      num_of_incorrect_guesses += 1

# Post-game summary.
print()

if num_of_incorrect_guesses < TOTAL_NUM_OF_INCORRECT_GUESSES_ALLOWED:
  print("Congratulations, you solved the puzzle!")
else:
  print("Sorry, you ran out of guesses.")

print()

print(f"{answer} is the answer to the puzzle.")