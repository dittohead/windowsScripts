import os
path = "c:\\wifi"
filelist = os.listdir(path)
for filename in filelist:
    current_file = path+"\\"+filename+'"'
    print(current_file)
    os.system('netsh wlan add profile filename="'+current_file)
