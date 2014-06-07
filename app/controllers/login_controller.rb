class LoginController < ApplicationController
  def login

	#ESTO DE ABAJO NO SE ESTÁ USANDO TODAVIA
	# por ahora los usuarios se están logueando por el controlador de Devise, eso es cuestion nada mas de
	# redirigirlos a la vista login/login.

	if !user_signed_in? #si no hay un usuario logueado. El signed_in es un metodo de Devise.
			# params es un hash que contiene los parametros retornados por la vista. La visa login/login tiene dos
			# campos de texto, uno para el email, otro para la contraseña. Cuando se apreta el boton, la vista los 
			# manda al controlador en el hash params, con la llave segun el nombre del entry. Un hash es como un diccionario,
			# pares de llave => valor.
			if (params.has_key?(:email) && params.has_key?(:password))	# si no hay parametros, no hace nada, porque significa que
				#es la primera vez que se carga
				#si hay parametros, entonces busca el usuario por el correo
				@user = User.find_by(:email => params[:email]) #busca al usuario por el correo.
				
				if !(@user.nil?) #si el usuario existe (no es nulo)
					if @user.valid_password?(params[:password]) #lo verifica con el hash. El metodo valid_password es de Devise, lo revisa
						#con encriptación porque en la base no se guarda la contraseña pura, sino pasada por bcrypt.
						sign_in(:user, @user) #lo loguea si es correcto. A partir de aca, current_user va a tener al usuario actual, y signed_in? responde true.
						redirect_to(current_user) #lo envia a su perfil
					else  #si la contraseña no corresponde
						flash.now["alert alert-danger"] = "Double check the email and/or password, please." 
					end
				else #el usuario no existe
					flash.now["alert alert-danger"] = "That user doesn't seem to exist. Try again."	
				end
			end
	else # si el usuario ya está logueado
		redirect_to(current_user) #lo envia a su perfil
	end


   end

end

