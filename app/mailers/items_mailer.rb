class ItemsMailer < ApplicationMailer
	default from: "info@mytest.localhost",
				template_path: 'mailers/items'

	def item_destroyed(item)
		@item =item
		mail to: 'borodaj-anna@yandex.ru',
				subject: "Item destroyed"
	end
	
end
