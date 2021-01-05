-----------------------------------------------------------------------------------------------------------------------
Q: How to Increase SSH Connection Timeout in Linux ?
A: 
$ sudo vi /etc/ssh/sshd_config
ClientAliveInterval  1200
ClientAliveCountMax 3

Once done, reload the OpenSSH daemon for the changes to come into effect.
$ sudo systemctl reload sshd


$ sudo systemctl reload sshd
Note:
1) ClientAliveInterval: specifies the time in seconds that the server will wait before sending a null packet 
                     to the client system to keep the connection alive.

2) ClientAliveCountMax: defines the number of client alive messages which are sent without getting any messages from the client. 
                     If this limit is reached while the messages are being sent, the sshd daemon will drop the session, 
                     effectively terminating the ssh session.

3) Timeout value = ClientAliveInterval * ClientAliveCountMax                     
   The Timeout value will be 1200 seconds * 3 = 3600 seconds. This is an equivalent of 1 hour.
4) sshd_config: for server
   ssh_config:  for client
 
 
----------------------------------------------------------------------------------------------------------------------- 
Q: How to Increase SSH Connection Timeout on MacOS ?
A:
(1) For all connection, create ~/.ssh/config and add:
Host *
    ServerAliveInterval 120

(2) For a single connection, just use the -o option:
$ ssh -o ServerAliveInterval=120 user@host

Note:
ServerAliveInterval :
Sets a timeout interval in seconds after which if no data has been received from the server, 
ssh will send a message through the encrypted channel to request a response from the server. 
The default is 0, indicating that these messages will not be sent to the server.

THE FOLLOWING INFORMATION IS NOT TESTED:
Specify the option "ConnectTimeout" for connection timeout, eg
$ ssh -o ConnectTimeout=240 -D 9999 user@host
Or 
in ~/.ssh/config add
Host *
  ConnectTimeout 240
  
