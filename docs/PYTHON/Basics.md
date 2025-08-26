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


