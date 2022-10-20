Hangman project from The Odin Project's curriculum

## Features:
- Word's length between 5 and 12
- English words, english alphabet (26 letters)
- 8 guesses
- Displays:
  - Word with uppercase discovered characters and _'s
  - Wrongly guessed characters
  - Example: (bicycle) -> BI_Y_LE // a d // 1 guess(es) remaining
- Game saving

## Game flow
- Choose between starting a new game or loading a previous one
- Loop until solved:
  - Put word, and done and remaining guesses
  - Get character
  - Either:
    - Save and exit
    - Continue
- Either:
  - Solved: Congratulate
  - Not solved: Bad luck!
- Either:
  - Repeat
  - Exit
