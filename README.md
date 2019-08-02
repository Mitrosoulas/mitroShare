# mitroShare
File Sharing program

mitroShare is a file sharing program written in Ruby. 
It uses a client-server architecture. The user who wants to send a file, runs the script and chooses the Send File option. The other user chooses receive file. Both users must agree to a predetermined port for communication. The user who sends the file enters the filename or path of the file he wants to send and the pre-shared port and listens for a connection. The user receiving the file, enters the public ip (if the communication is over the Internet) or the hostname of the sender and the pre-shared port. The file received retains it's original name and is saved at the same folder with the script.
