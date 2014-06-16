
#Controlador Miscelaneo para cosillas de la pagina, como el About, la Ayuda, y demás, no tiene modelo relacionado.

class MiscController < ApplicationController

	# la accion Help solamente muestra la visa misc/help. Como esto el controlador lo hace por defecto
	# (el controlador siempre hace lo que hace la acción y al final muestra la vista que se llama
	# igual que la accion), entonces no hay que hacer nada.
	def help 

		# al llegar al final de la acción, el controlador muestra la vista misc/help
	end

	def about
		if user_signed_in?
			redirect_to user_path(current_user)
		end
	end

	# el controlador hace lo mismo para cada vez que se le llama con alguna acción random, por ejemplo,
	# si se le llama con misc/about, aunque no tenga accion about, igual muestra la vista correspondiente.

end
