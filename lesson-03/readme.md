## 1. Написать скрипт, пользователь вводит строку из букв в нижнем регистре и верхнем регистре. Нужно посчитать, сколько в этой строке больших букв.
## 2. Написать скрипт, который будет делать ping google.com. Если сервер отвечает, то выводить - success, если нет - doesn't work.
## 3. Написать скрипт, который будет выводить текущую дату и время.

__________


## Task 1
```bash
#!/bin/bash


echo "Enter the random text:"
read input_text


uppercase_characters=$(echo "$input_text" | grep -o '[A-Z]')

echo $uppercase_characters


uppercase_count=$(echo "$uppercase_characters" | wc -w)

echo "The number of uppercase characters in the text: $uppercase_count"
```
