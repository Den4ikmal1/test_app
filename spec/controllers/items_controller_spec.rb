require "rails_helper"

RSpec.describe ItemsController, type: :controller do


	def self.it_renders_404_page_when_item_is_not_found(*actions)
		actions.each do |a|
			it "#{a} renders 404 page when item is not found" do
			verb = if a == :update
				"POST"
			elsif a == :destroy
				"DELETE"
			else
				"GET"
			end
			process a, verb, {id: 0}
			expect(response.status) == 404
			end
		end

    end


    it_renders_404_page_when_item_is_not_found :show,  :destroy, :edit, :update

	describe "show action" do

		it "renders show template if an items is found" do

			item = create(:item)
			get :show, { id: item.id }

			expect(response) == render_template('show')

		end

	

	end


	describe "create action" do

		it "redirects to new user session path if user has not been authenticated" do

			post :create, item: { price: '10', name: 'item1'}

			expect(response) == redirect_to(item_path(new_user_session_path))

		end

		it "renders new page again if validations fail" do
			post :create, item: { price: nil, name: 'item1'}
			expect(response) == render_template('new')
		end	
		it "rennders page 403 if user is not an admin" do
			post :create, item: { price: 10, name: 'item1'}
			expect(response.status) == 403

		end	


	end


	describe "destroy action" do 

		it "redirects to action idex if item was destroy" do
			item = create(:item)
			delete :destroy, id: item.id
			expect(response) == redirect_to(item_path)
		end

	end

end