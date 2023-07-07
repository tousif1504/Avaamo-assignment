Write a short program that prints each number from 1 to 100 on a new line.
    For each multiple of 3, print "AVA" instead of the number.
    For each multiple of 5, print "AMO" instead of the number.
    For numbers which are multiples of both 3 and 5, print "AVAAMO" instead of the number.
    NB: Any programming/scripting language can be used to do the above


Ans: solution is provided in avaamo.py
    This program uses a for loop to iterate over the numbers from 1 to 100. 
    Inside the loop, it checks if the current number is divisible by both 3 and 5 first, as that's the most specific case. 
    If so, it prints "AVAAMO". If not, it checks if the number is divisible by 3 only and prints "AVA" in that case. 
    Similarly, if the number is divisible by 5 only, it prints "AMO". 
    Finally, if none of the above conditions are met, it simply prints the number itself.