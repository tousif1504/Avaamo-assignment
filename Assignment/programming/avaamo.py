for num in range(1, 101):
    if num % 3 == 0 and num % 5 == 0:
        print("AVAAMO")
    elif num % 3 == 0:
        print("AVA")
    elif num % 5 == 0:
        print("AMO")
    else:
        print(num)