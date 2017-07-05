require 'rails_helper'

feature 'user visit my recipes' do
  scenario 'successfully' do

    user = User.create(email: 'banana@com.br', password: '123123')

    cuisine = Cuisine.create(name: 'Arabe')
    recipe_type = RecipeType.create(name: 'Entrada')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                          user: user)


    visit root_path
    click_on 'Login'
    fill_in('Email', with: 'banana@com.br')
    fill_in('Senha', with: '123123')
    click_on 'Enviar'
    click_on 'Minhas Receitas'

    expect(page).to have_content('Bolo de cenoura')



    # another_user = User.create(email: 'Another_banana@com.br', password: '123123')
    # another_recipe = Recipe.create(title: 'Salada de cenoura', recipe_type: recipe_type,
    #                                          cuisine: cuisine, difficulty: 'Facil',
    #                                          cook_time: 60,
    #                                          ingredients: 'Cenoura e legumes',
    #                                          method: 'Cozinhe a cenoura, misture com os legumes',
    #                                          user: another_user)


  end
  scenario 'and another user visit' do

    user = User.create(email: 'banana@com.br', password: '123123')

    cuisine = Cuisine.create(name: 'Arabe')
    recipe_type = RecipeType.create(name: 'Entrada')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                          user: user)

    another_user = User.create(email: 'Another_banana@com.br', password: '123123')
    another_recipe = Recipe.create(title: 'Salada de cenoura', recipe_type: recipe_type,
                         cuisine: cuisine, difficulty: 'Facil',
                         cook_time: 60,
                         ingredients: 'Cenoura e legumes',
                         method: 'Cozinhe a cenoura, misture com os legumes',
                         user: another_user)

     visit root_path
     click_on 'Login'
     fill_in('Email', with: 'banana@com.br')
     fill_in('Senha', with: '123123')
     click_on 'Enviar'
     click_on 'Minhas Receitas'

     expect(page).to have_content('Bolo de cenoura')
     expect(page).not_to have_content('Salada de cenoura')





  end
end
