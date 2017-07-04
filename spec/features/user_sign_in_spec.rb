require 'rails_helper'

 feature 'User sign in' do
   scenario 'successfully' do
     user = User.create(email: 'banana@com.br', password: '123123')

     visit root_path
     click_on 'Login'
     fill_in('Email', with: 'banana@com.br')
     fill_in('Senha', with: '123123')
     click_on 'Enviar'

     expect(current_path).to eq root_path
     expect(page).to have_content('Ola banana@com.br')
     expect(page).not_to have_link('Login')

   end

   scenario 'and then sign out' do
     user = User.create(email: 'banana@com.br', password: '123123')

     visit root_path
     click_on 'Login'
     fill_in('Email', with: 'banana@com.br')
     fill_in('Senha', with: '123123')
     click_on 'Enviar'
     click_on 'Sair'

     expect(current_path).to eq root_path
     expect(page).not_to have_content('Ola banana@com.br')
     expect(page).to have_link('Login')
   end

 end
