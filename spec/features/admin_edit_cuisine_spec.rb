require 'rails_helper'

feature 'Admin edit cuisine' do
  scenario 'successfully' do

    brazilian_cuisine = Cuisine.create(name: 'Brasileira')


    #simula acao do Admin

    visit root_path

    click_on 'Brasileira'
    click_on 'Editar'

    fill_in 'Cozinha', with: 'Japonesa'

    click_on 'Salvar'

    expect(page).to have_css('h1', text: 'Japonesa')
  end

  scenario 'and all fields must be filled' do
    brazilian_cuisine = Cuisine.create(name: 'Brasileira')

    #simula acao do Admin

    visit root_path
    click_on 'Brasileira'
    click_on 'Editar'

    fill_in 'Cozinha', with: ''

    click_on 'Salvar'

    expect(page).to have_content('Você deve preencher todos os campos')


  end

end
