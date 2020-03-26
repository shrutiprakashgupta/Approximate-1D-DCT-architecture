file_name = input("Input File with the binary data: ")
try:
    with open(file_name,'r') as data:
        content = data.read()
except IOError:
    print("Could not track the file, please check if it present in the same directory as this script. ")
    exit()

file_out = input("Output file name (to be generated): ")
output = open(file_out,'w') 

a = content.split("\n")
n = len(a)
a = [a[i].split(",") for i in range(n)]
for i in range(n):
    if(len(a[i])!=8):
        print("The input file format is in valid, must have 8 inputs in each line")
        exit()
    else:
        for j in range(4):
            output.write("{}_{}_{}\n".format(a[i][j],a[i][7-j],"1"))
            if(j%2==1):
                output.write("00000000_00000000_0\n")
        for j in range(3,-1,-1):
            output.write("{}_{}_{}\n".format(a[i][j],a[i][7-j],"0"))
            if(j%2==0):
                output.write("00000000_00000000_0\n")

output.close()
            