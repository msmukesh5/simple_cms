require "base64"

class Cryption

	def self.crypt
		key = "1234567890123456"
		data = "9876543210"
		m = nil
		f = File.open("/Users/Mukesh/workspace/helo/hello.txt", "r")
		f.each_line do |line|
		  m = line
		end
		f.close
		puts m


		cipher = OpenSSL::Cipher::AES.new(128, :CBC)
		cipher.encrypt
		cipher.key = key
		cipher.padding = 1
		# iv = cipher.random_iv
		# Rails.logger.info "IV : #{iv}"
		encrypted = cipher.update(data) + cipher.final

		# iv = "\x30\xd2\xff\x5d\x08\xac\x83\x95\x02\x0f\x23\x20\x81\xc9\xc1\xe4"
		# key = "1234567890ABCDEF1234567890ABCDEF"
		# message = "\xb8\x9f\x27\x30\xe5\x4d\x81\xf3\xa9\x3d\x0b\xe3\xaa\x52\x50\x15"
		openssl_cipher = OpenSSL::Cipher.new('aes-128-cbc')
		openssl_cipher.decrypt
		openssl_cipher.key = key
		# openssl_cipher.iv = iv
		result = openssl_cipher.update(encrypted) + openssl_cipher.final

		puts result

		# Rails.logger.info "data : #{data}"
		# Rails.logger.info "encrypted : #{encrypted}"

		# encryptedB = iv + encrypted
		# Rails.logger.info "encryptedB : #{encryptedB}"

		# decipher = OpenSSL::Cipher.new("AES-128-CBC");
		# decipher.decrypt
		# decipher.key = key

		# decipher.padding = 0
		# # decipher.iv = iv

		# plain = decipher.update(m) + decipher.final
		# # p = plain.pack('C*').force_encoding('utf-8')
		# Rails.logger.info "plain : #{plain}"
		# puts data == plain
		encrypted
	end


	def self.encryption(data,key)
		cipher = OpenSSL::Cipher::AES.new(256, :CBC)
		cipher.encrypt
		cipher.key = key
		cipher.padding = 1
		encrypted = cipher.update(data) + cipher.final
		puts "encrypt str : "+encrypted

		encrypted
	end

	def self.decryption(data,key)
		decipher = OpenSSL::Cipher::AES.new(256, :CBC)
		decipher.decrypt
		decipher.key = key
		decipher.padding = 1
		# decipher.iv = iv
		plain = decipher.update(data) + decipher.final

		plain
	end

	def self.test
		key = "12345678901234560000000000bncuebuscbscbsbcvb"
		data = "9876543210"
		m = encryption(data,key)
		puts "m : #{m}"
		d = decryption(m,key)
		puts " d : #{d}"
		
		data == d
	end
end