#! /bin/bash

#Example for a curl with notify me

curl https://api.notifymyecho.com/v1/NotifyMe -H "Content-Type: application/json" -d '{"notification":"An instance on X project went down. Instance name is X.","accessCode":""}'



#Example of http with notify me

#https://api.notifymyecho.com/v1/NotifyMe?notification=Hello team! the ticket ${issue.id} from devops has been updated&accessCode=amzn1.ask.account.AHI4CLTRYNBYVT2TKQHGBSVOYD2BNAKS7YDCOC2DF4MSO7K4FAU7AFA4K5L5NKICYAFQYLMYVAMEDO27YLTLZY6TXZ2IVONQEGQZFLEBTSZ3KKXJKGKEUMYCGEGYMPNDSC7HFJKKPUIPMTMLBQFC53AFCIBN7NBOGF2GQ7MGXTDO7QB3SDFCEMS5KISFMJT6GTP2KEHK2QMPXGQ