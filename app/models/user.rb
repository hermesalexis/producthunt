class User < ActiveRecord::Base
	has_secure_password validation: false #Queda cifrado la contraseña
end
