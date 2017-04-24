import sys

scoreMatrix = [[2,-5,-5,-1],
               [-5,2,-1,-5],
               [-5,-1,2,-5],
               [-1,-5,-5,2]]

#Dictionary used to grab values from the score matrix based on the current sequences' characters
scoreMatrixMap = {"A":0,
                  "C":1,
                  "G":2,
                  "T":3}

gapPenalty = -5

'''
A dynamicArray is instantiated and, thanks to Pythons weak-typing, needs to be
instantiated as a list and have lists appended to it as the algorithm goes on.

The nested for loops iterate over sequence_x and compares it to all characters in sequence_y

The first set of if statements prevents index out of bounds errors from occuring
by assigning values to comparisons of empty substrings.

The else statement is where the actual string comparisons happen using the following formula:

    _max = max(A(x-1,y-1) + M(s1_x,s2_y), A(x-1,y)+d, A(x,y-1)+d)

    Where:
                A is dynamicArray
                M is scoreMatrix
                d is gapPenalty
                s1 is sequence_x
                s2 is sequence_y
                x,y is current iteration
'''

def sequenceMapping(sequence_x, sequence_y):
    dynamicArray = []
    for x in range(len(sequence_x)):
        dynamicArray.append([])
        for y in range(len(sequence_y)):
            if x == 0 and y == 0:
                dynamicArray[x].append(0)
            elif x == 0 and y != 0:
                dynamicArray[x].append(gapPenalty + dynamicArray[x][y-1])
            elif x != 0 and y == 0:
                dynamicArray[x].append(gapPenalty + dynamicArray[x-1][y])
            else:              
                _max = max(dynamicArray[x-1][y-1] + scoreMatrix[scoreMatrixMap[sequence_x[x]]][scoreMatrixMap[sequence_y[y]]],dynamicArray[x][y-1] + gapPenalty,dynamicArray[x-1][y] + gapPenalty)
                dynamicArray[x].append(_max)                
    return dynamicArray

'''
The following method aligns the sequences based on
which of the previous values created the current value.

If the current value was based off of the diagonal,
then it appends both characters.

If it was based off of the value to the left,
then it applies a gap to sequence_y and the current
character to sequence_x.

Otherwise it applies a gap to sequence_x and the
current character to sequence_y

The return statement returns a tuple containing
the final score, and the two aligned strings
'''

def sequenceAligning(dynamicArray, sequence_x, sequence_y):    
    x_out = ""
    y_out = ""
    x = len(sequence_x)-1 
    y = len(sequence_y)-1
    
    while x > 0 or y > 0:
        if x > 0 and y > 0 and dynamicArray[x][y] == dynamicArray[x-1][y-1] + scoreMatrix[scoreMatrixMap[sequence_x[x]]][scoreMatrixMap[sequence_y[y]]]:
            x_out = sequence_x[x] + x_out
            y_out = sequence_y[y] + y_out
            x -= 1
            y -= 1
        elif x > 0 and dynamicArray[x][y] == dynamicArray[x-1][y] + gapPenalty:
            y_out = '-' + y_out         
            x_out = sequence_x[x] + x_out
            x -= 1                
        else:
            x_out = '-' + x_out          
            y_out = sequence_y[y] + y_out
            y -= 1            
    return [dynamicArray[len(dynamicArray)-1][len(dynamicArray[0])-1],x_out, y_out]

'''
Trivial file import method
'''

def importFile(path):
    try:
        file = open(path, 'r')        
        sequence_x = file.readline()
        sequence_y = file.readline()        
        file.closed
    except FileNotFoundError:        
        print("File not found")
        sys.exit()
    return [sequence_x, sequence_y]

'''
Performs string manipulation to eliminate any trailing white space
and adds a space to the beginning of each sequence to account for
empty substring comparisons.
'''

def main(argv):
    sequences = importFile(argv[1])    
    sequence_x = sequences[0]
    sequence_y = sequences[1]
    sequence_x = " " + sequence_x
    sequence_y = " " + sequence_y

    if sequence_x[len(sequence_x)-1].isspace():
        sequence_x = sequence_x[:-1]

    if sequence_y[len(sequence_y)-1].isspace():
        sequence_y = sequence_y[:-1]
        
    dynamicArray = sequenceMapping(sequence_x, sequence_y)
    output = sequenceAligning(dynamicArray,sequence_x,sequence_y)

    print("Score:", output[0])
    for item in output[1:]:
        print(item)

#Method calls
main(sys.argv)
                                                                             
                                                                            
