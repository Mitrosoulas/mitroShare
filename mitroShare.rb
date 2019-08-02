require 'socket'

puts 'MITROSHARE V1.0'
loop {
puts "*************************\n*************************\n1.Receive File\n2.Send File"
choice = gets.chomp.to_i

loop {
if choice == 1
	puts'ENTER HOST NAME OR IP:'
	host = gets.chomp 
	puts 'ENTER PORT:'
	port = gets.chomp.to_i

	socket = TCPSocket.open(host,port)
	puts 'CONNECTED TO SERVER...'
	fileName = socket.gets.chomp
	puts 'GOT FILENAME...'
	socket.puts 1
	puts 'BEGIN DOWNLOAD OF FILE:'+fileName
	data = socket.read
	puts fileName
	destFile = File.new(fileName,'wb')
	destFile.write data
	destFile.close
	break;
elsif choice == 2
	puts 'ENTER PORT:'
	port = gets.chomp.to_i
	server = TCPServer.open('0.0.0.0',port)
	puts 'ENTER FILE NAME'
	fName = gets.chomp 
	file = open(fName,'rb')
	fContent = file.read
	puts 'Ready to send file: '+ fName
	client = server.accept
	puts 'CLIENT CONNECTED...'
	client.puts(fName)
	puts 'NAME SENT...'
	response = client.gets.chomp.to_i
	if response == 1
		puts 'RESPONSE OK...'
		client.puts(fContent)
		client.close
	end
	break;
end 
}
}