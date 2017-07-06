require 'rails_helper'

feature 'user favorite recipe' do

  scenario 'successfully' do
    arabian_cuisine = Cuisine.create(name: 'Arabe')
    brazilian_cuisine = Cuisine.create(name: 'Brasileira')

    appetizer_type = RecipeType.create(name: 'Entrada')
    main_type = RecipeType.create(name: 'Prato Principal')
    dessert_type = RecipeType.create(name: 'Sobremesa')

    user = User.create(email: 'banana@com.br', password: '123123')

    recipe = Recipe.create(title: 'Bolodecenoura', recipe_type: main_type,
                          cuisine: arabian_cuisine, difficulty: 'Médio',
                          cook_time: 50,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                          user: user)

    # simula a ação do usuário
    visit root_path

    click_on 'Login'
    fill_in('Email', with: 'banana@com.br')
    fill_in('Senha', with: '123123')
    click_on 'Enviar'

    click_on 'Bolodecenoura'

    click_on 'Favoritar'

    expect(page).to have_content('Desfavoritar')



  end

end
