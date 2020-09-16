import urllib.request
import os

u1 = "https://fhs7001-gn-61.lgucdn.com/nsbsmedia/_definst_/sbsmediamp4/et/0230/et0230f0001000.mp4/media_w741980880_"
u2 = ".ts?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1ODQ4ODkxNzMsInBhdGgiOiIvbnNic21lZGlhL19kZWZpbnN0Xy9zYnNtZWRpYW1wNC9ldC8wMjMwL2V0MDIzMGYwMDAxMDAwLm1wNCIsImR1cmF0aW9uIjotMX0.NDu-HFtNsbPXqwaNEkT3KHo_KhXKO3TJJgIVzRS27uo"

out_name = "bullkot10"

def urlstr(i):
 return u1 + str(i) + u2

out_f = open(out_name + '.ts', 'wb')

for n in range(1000):
 sN = '{:03d}'.format(n)
 print(sN)
 ts_name = sN + '.ts'
 try:
   urllib.request.urlretrieve(urlstr(n), ts_name)
 except IOError:
   print("File not accessible")
   break
 finally:
   if os.path.isfile(ts_name):
     ts_f = open(ts_name, 'rb')
     ts_data = ts_f.read()
     ts_f.close()
     os.remove(ts_name)
     out_f.write(ts_data)
   else:
     break

out_f.close()
