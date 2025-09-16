---
comments: true
tags:
- PYTHON

---
# Basics

In Python the indentation of code is important. Everything that is indented on the same level belongs to a block.

## Variables
Variables store values.

```py
name = "me"
age = 39
```
Variables can't start with a number and can't have character like `%` or `!`.

We also can't use python *keywords* like `if,for,while...` 

## Expressions and Statements
Expression is any code that returns a value.
`1+1`

A statement is an operation on a value - we are doing something with the value.
`print(1+1)`

## Comments
Everything after `#` is ignored and can be used as comment
`# This is a comment`

## Data types
*string* - `name = "hans"`

*integer* - `age = 2`

*float* - `temp = 2.9`

*boolean* - `isEven = True`

We can check what data type a variable has  with `type()`.

Python automatically detects type of variables.

To check if something is of type string
```py
name = "hans"
type(name) == str

#or

isinstance(name,str)
```

To convert int into float we can use the class-constructor of the datatype class
`temp = float(2)`

`age = int("20")` -> becomes an int

The conversion is called *casting*

If these conversions fail we actually get an error in the console.

## Operators
assignment operator `=` - assigns a value to a variable

### Arithmetic operators
```py
+ #addition
- #subtraction
* #multiplication
/ #division
% #remainder
** #squared
// #floor division - does the division and rounds down to the nearet whole number
```

We can combine *arithmetic* with *assignment* operator

`+=`, `*=` ... 
`age += 8` -> `age = age +8`

### Comparison operation
```py
a == b #- Equal
a != b  #- Not equal
a > b  #- Greater
a < b #- Smaller
```

### Boolean operators
```py
not - #True when false
and - # both conditions have to be true
or - # one of the conditions have to be true
```

`or` returns the first not false value otherwise it returns the last operand

```py
print(False or 'hey') # -> 'hey'
print(True or 'hey') # -> True
print(1 or 0) # -> 1
```

`and` only evaluates the second argument if the *first is true*.
If the first argument is *falsy* it returns that argument - otherwise it evaluates the seconds argument.

```py
print(0 and 1) # -> 0
print(False and 'hey') # -> False
print('hey' and 'hi') # -> hi
```

### Bitwise operators
```py
& # performs binary AND
| # performs binary OR
^ # performs binary XOR
~ # performs binary NOT
<< # shift left operation
>> # shift right operation
```

### is/in operators
`is` is used to compare objects and returns true if both are the same object

`in` is membership operator - if value is contained in list or other sequence.


### Ternary operator
If-Else in one line. Allows to quickly define a conditional
`return True if age > 18 else False`

## Strings
*Strings* are a series of characters
```py
"hallo"
'hallo'
```
We can combine/concatenate strings with `+`
`'hallo'+'world'`

For multiline string we use three
```py
"""My
name
is
"""
```

### String Methods
`.upper()` converts string into all capital letters
`.lower()` converts string into all lower letters
`.title()` makes first letter of each string capital

To evaluate strings
`.islower()` `.isupper()`
`.isalpha()` check if string contains only characters and is not empty
`.isalnum()` check if string contains characters or digits and is not empty
`.isdecimal()` check if string contains digits and is not empty
`.startswith()`/`.endswidth()` check if string starts/ends with substring
`.replace()` to replace part of string
`.split()` split string or specific character separator
`.strip()` trim white space from a string
`.join()` append new letters to a string
`.find()` find position of substring. 

All these methods return *the new modified string.* It's not changing anything in the original string.

We also can use *global* functions on strings.
`len()` - get amount of character of string
`in`
```py
"AU" in "BEAU" # -> TRUE
```

If we want to show `"` character in a string we need to add a backslash `\`

`"He\"llo"`

The backslash is also used to add a new line into a string
`"Hello\n World"`

To get a specific character from a string
`name[1]` - character at index 1
`name[-1]` - character at the end

To get a range we do slicing
```py
name = "ABCDEF"
name[1:3] # -> "BC" - It stops before second index 3
name[1:] # -> "BCDEF" - Blank means it goes to the end or beginning
name[:3] # -> "AB"
```

## Booleans
*Booleans* are `True` or `False` values.
`done = True`

*Numbers* always return `True` exept `0`. Even negative numbers.

```py
if 10: # <- True
    print("yes")
```


*Strings* are only `False` when they are *empty*

To check if type of value is boolean
`type(value) == bool`

The `any()` functions returns `True` if *any* element of an iterable like a *List* is `True`.
`any([True,False])` -> True

`all()` function returns `True` if *all* elements of an iterable are `True`.

## Number datatype
*Number* datatype allows to create the mathematical *complex number*
`complex = 2+3j`
or
`num = complex(2,3)`

To get the *complex* or *real* part of the *complex number*
`num.real`
`num.imag`

`abs(-5.5)` - To get the *absolut* value of a number 
`round(5.5)` - round to nearest integer
`round(5.5,1)` - round to nearest decimal point.

## Enums
*Enums* are readable names that are bound to constant values.
To use *Enums* we have to import them.
```py
from enum import Enum

class MyState(Enum):
    INACTIVE = 0
    ACTIVE = 1


print(State.INACTIVE)
print(STATE.ACTIVE.value)
```
Enums are the only way to create *constants* in Python.

## User Input
To get the input from the user at runtime we can use `input("prompt")`. Execution will be stopped till the user made an input and hits *Enter* key.

## Control statements
### if statement
```py
if condition == True:
    #Execute this
```

### if-else statement
```py
if condiation == True:
    # Execute if condition is true
else:
    #Execute if condition is false
```

### Multiple condition checks
For multiple condition checks we can use `elif`
```py
if condition1 == True:
    #Execute this
elif condition2 == True:
    #Execute that
elif condition3 == True:
    #Execute this
#...
else:
    #if all the others are false
```

## Lists
*List* are an essential data structure in Python. It allows to hold different datatypes
`dogs = ["Horse","Jim",3]`

With `in` operator we can check if an item is inside a list
`print("Jim" in dogs)` -> True

To define an empty list 
`emptyList = []`

To reference items from lists we can use the *index* 
`element0 = dogs[0]`

To pick from the end of the list we use `-` 
`lastElement = dogs[-1]`
`secondToLast = dogs[-2]`

To update an item in a list 
`dogs[2] = "hans"`

To extract parts of the list we can use slicing
`firstTwoElements = dogs[:2]`
This returns a slice of the list

`len(dogs)` counts how many elements a list has.

To add items to a list we can use the `.append()` method.
`dogs.append("Ruff")`

To combine two lists together we can use `.extend()`
`allDogs = dogs.extend(['hallo',"Ruofo",True])`

Another way is to use `+=`
`dogs += ["freaky",23]`


