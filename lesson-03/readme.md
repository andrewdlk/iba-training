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
