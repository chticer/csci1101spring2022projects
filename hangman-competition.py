import re
import random

NUM_OF_INCORRECT_GUESSES_ALLOWED = 5

puzzle_answers_file = open("puzzle-answers-full-pool.txt")

puzzle_answers = []

for current_puzzle_answer in puzzle_answers_file.readlines():
  puzzle_answers.append(current_puzzle_answer.strip("\n"))

puzzle_answers_file.close()

puzzle_categories_file = open("puzzle-categories-full-pool.txt")

puzzle_categories = []

for current_puzzle_category in puzzle_categories_file.readlines():
  puzzle_categories.append(current_puzzle_category.strip("\n"))

puzzle_categories_file.close()

puzzle_pool_indices = [*range(len(puzzle_answers))]

random.shuffle(puzzle_pool_indices)

num_of_correct_puzzles = 0

puzzle_pool_current_index = 0

while puzzle_pool_current_index < len(puzzle_pool_indices):
  current_puzzle_answer = puzzle_answers[puzzle_pool_indices[puzzle_pool_current_index]]

  puzzle_answer_guessed = []

  for current_puzzle_answer_character in current_puzzle_answer:
    if re.search("^[A-Z]$", current_puzzle_answer_character):
      puzzle_answer_guessed.append(False)
    else:
      puzzle_answer_guessed.append(True)

  print("--------------------------------------------------------------------------")
  print(f"Number of correct puzzles: {num_of_correct_puzzles}")

  print()

  print(f"{puzzle_categories[puzzle_pool_indices[puzzle_pool_current_index]]} is the category for this puzzle.")

  guessed_letters = []
  num_of_incorrect_guesses = 0

  while num_of_incorrect_guesses < NUM_OF_INCORRECT_GUESSES_ALLOWED and False in puzzle_answer_guessed:
    print("--------------------------------------------------------------------------")
    print("Letters guessed: ", end = "")

    for current_guessed_letter in guessed_letters:
      print(f"{current_guessed_letter} ", end = "")

    print()

    print(f"Number of incorrect guesses remaining: {NUM_OF_INCORRECT_GUESSES_ALLOWED - num_of_incorrect_guesses}")

    print()

    for answer_index in range(len(current_puzzle_answer)):
      if puzzle_answer_guessed[answer_index]:
        print(current_puzzle_answer[answer_index], end = "")
      else:
        print("_", end = "")

    print()
    print()

    letter = input("Enter a letter or type -1 to skip this puzzle: ")

    letter = letter.upper()

    print()

    if letter == "-1":
      break

    if letter not in guessed_letters and len(letter) == 1 and re.search("^[A-Z]$", letter):
      guessed_letters_insert_index = 0

      for current_guessed_letter in guessed_letters:
        if letter < current_guessed_letter:
          break

        guessed_letters_insert_index += 1

      guessed_letters.insert(guessed_letters_insert_index, letter)

      if letter in current_puzzle_answer:
        for answer_index in range(len(current_puzzle_answer)):
          if letter == current_puzzle_answer[answer_index]:
            puzzle_answer_guessed[answer_index] = True
      else:
        num_of_incorrect_guesses += 1

  if num_of_incorrect_guesses < NUM_OF_INCORRECT_GUESSES_ALLOWED and False not in puzzle_answer_guessed:
    print("Congratulations, you guessed the puzzle.")

    num_of_correct_puzzles += 1
  else:
    print("Sorry, you ran out of guesses or skipped the puzzle.")

  print()

  print(f"{current_puzzle_answer} is the answer to the puzzle.")

  print()
  print()
  print()

  puzzle_pool_current_index += 1
