# Basic Scripts

## Example of a Variable

```bash
#!/bin/bash
echo "how old are you ?"
read year
echo 'you're $year years old"
```

## Example of a loop

```bash
#!/bin/bash
for i in {1..10};
do
echo $i
done
```

## Example of a condition

```bash
#!/bin/bash
echo "Please enter your name first:"
read name
if [ "$name" = "Stewart" ]; then
        echo "Welcome Stewart! Here is the secret: THM_Script"
else
        echo "Sorry! You are not authorized to access the secret."
fi
```